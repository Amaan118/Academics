import socket


def fact(num):
    if -1 < num < 2:
        return 1

    return num * fact(num-1)


if __name__ == "__main__":
    # Set the host as localhost
    host = "127.0.0.1"

    # Set Port as 5000
    port = 2000

    # Initialize the socket
    try:
        server = socket.socket()
    except socket.error as Err:
        print("Error Initializing the Socket : ", Err)

    # Bind the host and port together
    server.bind((host, port))

    # Start the Server
    server.listen(3)

    while True:
        conn, add = server.accept()
        print("Server Connected to Address : ", add)

        # Decode the data to string from readable buffer
        data = conn.recv(1024).decode()

        # If provided number is negative then terminate the server and end the program
        if int(data) < 0:
            conn.close()
            break

        # Calculate the factorial of the given number and store it in ans
        ans = str(fact(int(data)))

        # Send the calculated value to client by encoding it
        conn.send(ans.encode())

        conn.close()
        break
