from flask import Flask, jsonify, request, send_file
from openie import StanfordOpenIE
import math
import os

app = Flask(__name__)

client = StanfordOpenIE()

@app.route('/getGraph', methods=['POST'])
def get_image():
    json = request.json
    # text = json['text']
    text = 'Barack Obama was born in Hawaii. Richard Manning wrote this sentence.'
    graph_image = 'graph.png'
    client.generate_graphviz_graph(text, graph_image)
    return send_file(graph_image, mimetype='image/png')

if __name__ == '__main__':
	app.run(debug=True, port=int(os.environ.get('PORT', 9090)), host='0.0.0.0')
