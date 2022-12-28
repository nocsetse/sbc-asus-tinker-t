# .... imports
import paho.mqtt.client as paho
import os
import json

# .... later in the code
    top_k = predictions.argsort()[-FLAGS.num_top_predictions:][::-1]
    for node_id in top_k:
      human_string = node_lookup.id_to_string(node_id)
      score = predictions[node_id]
      print('==> %s (score = %.5f)' % (human_string, score))
      row = [ { 'human_string,': str(human_string),  'score,': str(score)} ]
      json_string = json.dumps(row)
      client = paho.Client()
      client.connect("192.168.1.151", 1883, 60)
      client.publish("tinker1", payload=json_string, qos=0, retain=True)
