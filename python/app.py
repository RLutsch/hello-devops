from flask import Flask, jsonify

app = Flask(__name)

# Define a route to get the status
@app.route('/get-status', methods=['GET'])
def get_status():
    # Replace this with your actual logic to get the status
    status = 'on'  # Example status, you can change this as needed
    return jsonify({'status': status})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Replace with your preferred host and port
