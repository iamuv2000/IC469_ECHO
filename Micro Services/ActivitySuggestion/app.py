from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/activity-suggestions", methods=['POST'])
def getActivitySuggestion():
    json = request.json
    indexKeys = json["indexKeys"]
    records = json["record"]
    print(records)
    sampleResponse = ["jogging", "exercise", "netflix", "goodSleep", "socialize"]
    return jsonify(sampleResponse)

if __name__ == '__main__':
	app.run(debug=True, port=9090, host='0.0.0.0')
