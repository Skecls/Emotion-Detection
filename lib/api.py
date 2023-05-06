from flask import Flask,redirect,url_for,render_template,request,Response,send_file
from PIL import Image as im
import cv2
import numpy as np
import tensorflow as tf 
from keras.models import model_from_json
import processemotion

def process_video():
    cap=cv2.VideoCapture(r'"C:\Users\singh\Pictures\Camera Roll\WIN_20230429_18_12_55_Pro.mp4"')

    #video_file = request.files['video']

    cap = cv2.VideoCapture(video_file)
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
        processed_frame = processemotion.giveEmotion(frame)
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
    return send_file(response,mimetype='video/mp4',as_attachment=True,attachment_filename='output.mp4');