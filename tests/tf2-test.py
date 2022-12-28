#import tensorflow as tf
import tflite_runtime.interpreter as tflite
import os

print("PYTHONPATH:", os.environ.get('PYTHONPATH'))
print("PATH:", os.environ.get('PATH'))

tf.config.list_physical_devices('GPU') 
