import socket
import threading as threads

mutex = threads.Lock()


def factorial(conn):
    while True:
	    data = conn.recv(1024).decode()
	    if data == "-1":
	        break
	    
	    data = int(data)
	    fact = 1
	    while data:
	        fact *= data
	        data -= 1
	    
	    fact = str(fact)
	    conn.send(fact.encode())
	
    conn.close()

def Main():
    host = "127.0.0.1"
    port = 8000
    
    try:
        server = socket.socket()
        server.bind((host, port))
        print(f"Binding of Port {port} to host {host} done!")
        
        server.listen(5)
        print("Server Started")
    
    except socket.error as Err:
        print("Connection failed !")
        print("Reason : ", Err)
    
    
    while True:
        conn, addr = server.accept()
        recHost, recPort = addr[0], addr[1]
        
        mutex.acquire()
        print(f"Got a connection from {recHost}:{recPort}")
        
        t1 = threads.Thread(target=factorial, args=(conn,))
        t1.start()
        t1.join()
        break
    
    server.close()


if __name__ == '__main__':
	Main()

