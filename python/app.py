from flask import Flask, jsonify
import psycopg2

app = Flask(__name)

# Database connection parameters
db_params = {
    "dbname": "mybelovedpet",
    "user": "petster",
    "password": "your_password_here",
    "host": "localhost",  # Change this if your database is on a different host
}

# Function to create the "pressed" table
def create_pressed_table():
    try:
        conn = psycopg2.connect(**db_params)
        cur = conn.cursor()

        # Create the "pressed" table if it doesn't exist
        cur.execute("CREATE TABLE IF NOT EXISTS pressed (id SERIAL PRIMARY KEY, count INT DEFAULT 0);")
        conn.commit()
    except Exception as e:
        print(str(e))
    finally:
        if conn:
            conn.close()

# Define a route to get the status
@app.route('/get-status', methods=['GET'])
def get_status():
    # Replace this with your actual logic to get the status
    status = 'on'  # Example status, you can change this as needed
    return jsonify({'status': status})

# Define a route to increment the "pressed" table
@app.route('/pressed', methods=['POST'])
def increment_pressed():
    try:
        conn = psycopg2.connect(**db_params)
        cur = conn.cursor()

        # Increment the "pressed" table
        cur.execute("UPDATE pressed SET count = count + 1;")
        conn.commit()

        return jsonify({'message': 'Counter incremented successfully'})
    except Exception as e:
        return jsonify({'error': str(e)})
    finally:
        if conn:
            conn.close()

if __name__ == '__main__':
    # Create the "pressed" table if it doesn't exist
    create_pressed_table()

    app.run(host='0.0.0.0', port=5000)  # Replace with your preferred host and port
