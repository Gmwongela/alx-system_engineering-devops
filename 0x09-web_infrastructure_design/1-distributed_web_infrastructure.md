Design of Three-Server Web Infrastructure for www.foobar.com:

1. Load Balancer (HAproxy):
   - The load balancer is added to distribute incoming traffic across multiple servers for improved performance, high availability, and load distribution.
   - Distribution Algorithm: Round-robin algorithm, which evenly distributes requests across the available servers.

2. Server 1:
   - Hosts the Nginx web server responsible for handling incoming HTTP requests, SSL/TLS termination, and serving static content.
   - Nginx forwards dynamic requests to the application server(s) through the load balancer.

3. Server 2:
   - Also hosts an Nginx web server to share the load and provide redundancy.
   - Like Server 1, it forwards dynamic requests to the application server(s) through the load balancer.

4. Application Server:
   - Hosts the application code responsible for generating dynamic content, processing user requests, and interacting with the database.
   - Multiple application servers can be added for scalability.

5. Set of Application Files (Code Base):
   - These files contain the website's logic, functionality, and dynamic content.

6. Database (MySQL) - Primary-Replica Cluster:
    Primary Node (Master):
     - Responsible for handling write operations (inserts, updates, deletes) to the database.
     - Replication logs are created and sent to the replica nodes.
   Replica Node(s) (Slave):
     - Handle read operations from the database.
     - Replicate data changes from the primary node by applying replication logs.

Explanation of Additional Elements:

1. Load Balancer (HAproxy): 
Added for distributing traffic across multiple servers to ensure load balancing, reduce server load, and provide redundancy.

2. Server 2:
Added to enhance redundancy and fault tolerance, ensuring that even if one server fails, the other can still handle traffic.

3. Database Primary-Replica Cluster:
Implemented to enhance database performance, provide high availability, and allow read scalability by distributing read traffic to replica nodes.

4. Load Balancer Configuration:
Round-robin algorithm is used, distributing incoming requests in a circular manner to each server in sequence.

5. Active-Active vs. Active-Passive:
This setup is Active-Active, as both Server 1 and Server 2 are actively handling incoming requests. Active-Passive would mean only one server is actively serving, while the other is in standby.

6. Database Primary-Replica (Master-Slave) Cluster:
- Primary Node (Master) handles write operations.
- Replica Node(s) (Slave) handle read operations and replicate changes from the primary node.

Issues with the Infrastructure:

1. Single Point of Failure (SPOF):
   - The load balancer could become a SPOF. If it fails, traffic distribution would halt.
   - Lack of redundancy in the load balancer, application servers, and database nodes.

2. Security Issues:
   - No firewall in the design, leaving the infrastructure susceptible to unauthorized access.
   - No HTTPS  exposing data to potential interception.

3. No Monitoring:
   - Without monitoring, there's no insight into server performance, availability, or potential issues.


