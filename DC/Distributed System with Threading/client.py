import socket


def Main():
	host = '127.0.0.1'
	port = 8000
	
	
	try:
	    client = socket.socket()
	    client.connect((host, port))
	except socket.error as Err:
	    print("Connection Failed due to ", Err)
	
	
	while True:
	    number = input("Enter Number to Find Factorial : ")
	    
	    if int(number) < 0:
	        client.send("-1".encode())
	        break
	    
	    client.send(number.encode())
	    
	    answer = client.recv(1024).decode()
	    print(f"The Factorial of {number} is : {answer}")
	
	client.close()

if __name__ == '__main__':
	Main()

