import socket


if __name__ == "__main__":
    # Set the host and port
    host = "127.0.0.1"
    port = 2000

    # Initialize the Socket
    client = socket.socket()

    # Connect to the Host
    print("Connecting to host ", host, " with port ", port)
    try:
        client.connect((host, port))
    except socket.error as Err:
        print("Connection Failed because of : ", Err)

    # Take the number input from client
    num = input("Enter Number to find Factorial : ")

    # Send the number to server
    client.send(num.encode())

    # Save the ans obtained from server to ans
    ans = client.recv(1024).decode()

    # Print the ans
    print("Factorial of ", num, " is : ", ans)

    client.close()
