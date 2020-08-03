from flask import Flask, jsonify, request, send_file
import corelate
import math
import os

app = Flask(__name__)

@app.route("/activity-suggestions", methods=['POST'])
def getActivitySuggestion():
    json = request.json
    cor = corelate.find_corelations(json)
    i = -1
    dict = {}
    for x in cor:
        i = i + 1
        type(x)
        if (i == 0 or x < 0 or math.isnan(x)):
            continue
        dict[request.json['indexKeys'][i]] = x
    return jsonify(dict)

@app.route('/getGraph')
def get_image():
    filename = 'sample.jpg'
    return send_file(filename, mimetype='image/jpg')

if __name__ == '__main__':
	app.run(debug=True, port=int(os.environ.get('PORT', 9090)), host='0.0.0.0')
