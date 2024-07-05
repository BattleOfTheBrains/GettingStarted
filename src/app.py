from flask import Flask, jsonify, request

app = Flask(__name__)

# A simple in-memory data store for the example
potato_growth_status = {
    "growth_stage": "planting",
    "health_status": "healthy",
    "estimated_yield": 0,
}


@app.route("/status", methods=["GET"])
def get_status():
    """Endpoint to get the current status of the potato growth."""
    return jsonify(potato_growth_status)


@app.route("/status", methods=["POST"])
def update_status():
    """Endpoint to update the status of the potato growth."""
    data = request.get_json()
    for key in data:
        if key in potato_growth_status:
            potato_growth_status[key] = data[key]
    return jsonify(potato_growth_status), 200


if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')
