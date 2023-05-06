from flask import Flask,redirect,url_for,render_template,request,Response
from PIL import Image as im
import cv2
import numpy as np
import tensorflow as tf 
from keras.models import model_from_json

emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}

def giveEmotion(frame):
    json_file = open('emotion_model.json', 'r')
    loaded_model_json = json_file.read()
    json_file.close()
    emotion_model = model_from_json(loaded_model_json)

    emotion_model.load_weights("emotion_model.h5")
    img = cv2.resize(frame, (1280, 720))
    gray_frame = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    face_detector = cv2.CascadeClassifier(cv2.data.haarcascades+"haarcascade_frontalface_default.xml")
    num_faces = face_detector.detectMultiScale(gray_frame, scaleFactor=1.3, minNeighbors=5)

    for (x, y, w, h) in num_faces:
        cv2.rectangle(img, (x, y-50), (x+w, y+h+10), (0, 255, 0), 4)
        roi_gray_frame = gray_frame[y:y + h, x:x + w]
        cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray_frame, (48, 48)), -1), 0)

        emotion_prediction = emotion_model.predict(cropped_img)
        maxindex = int(np.argmax(emotion_prediction))
        cv2.putText(img,emotion_dict[maxindex], (x+5, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2, cv2.LINE_AA)

    return img


app = Flask(__name__)
@app.route('/')
def front():
    return '<p>hello</p>'

@app.route('/endpoint')
def process_video():
    cap=cv2.VideoCapture(r'C:\Users\subha\Pictures\Camera Roll\WIN_20230429_19_18_48_Pro.mp4')

    # video_file = request.files['video']

    # cap = cv2.VideoCapture(video_file)
    fps = cap.get(cv2.CAP_PROP_FPS)
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
    out = cv2.VideoWriter('output.mp4', fourcc, fps, (width, height))

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Apply emotion detection to the frame
        processed_frame = giveEmotion(frame)
        # cv2.imshow('frame',processed_frame)

        # Add the processed frame to the output video
        out.write(processed_frame)

    # Release the video file and the output video writer
    cap.release()
    out.release()

    with open('output.mp4', 'rb') as f:
        output_video = f.read()
    response = Response(output_video, mimetype='video/mp4')
    response.headers.set('Content-Disposition', 'attachment', filename='output.mp4')
    return response
        


if __name__ == '__main__':
    app.run(debug = True)