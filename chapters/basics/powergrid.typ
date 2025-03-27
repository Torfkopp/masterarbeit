== Powergrid

A power grid is an interconnected network that delivers electricity from producers to consumers. It is the backbone of modern electrical infrastructure, ensuring that power generated in various plants, such as coal, natural gas, nuclear, hydroelectric, wind, and solar, reaches homes, businesses, and industries across vast distances. The power grid operates through a complex system of transmission lines, substations, transformers, and distribution lines, all coordinated to maintain a stable and continuous supply of electricity.

The power grid can be broadly divided into three main components: generation, transmission, and distribution. Generation refers to the process where power is produced at power plants. Transmission involves moving this electricity over long distances through high-voltage lines to different regions. Distribution is the final step, where electricity is delivered to end-users through lower-voltage lines.

To function efficiently, power grids rely on real-time monitoring and control systems to balance supply and demand, ensuring the grid remains stable despite fluctuations.
The distribution grid faces the challenge of integrating distributed generation (DG) in the form of renewable energy sources like wind and solar, which are variable by nature. The main impacts of DG in the distribution grid are power flow inversion, voltage increase, overcurrent, and the risk of overheating the cables. Furthermore, the increasing use of electric vehicles (EVs) and heat pumps can further strain the distribution grid by increasing peak demand. Thus, monitoring the distribution grid is essential, but currently not done enough. @alymov2024monitoring @vilela2021analysis @albu2016syncretic

Power generation primarily relies on electromagnetic induction, where a changing magnetic field creates a current in a conductor. Large-scale generation uses mechanical motion to provide a consistent changing magnetic field. The rotating magnetic core (rotor) induces current in the fixed wire (stator), which interfaces with the power transmission system. The rotation of the magnetic core causes the current to alternate, with the grid frequency fixed (e.g. 50 Hz in continental Europe). Deviations from this frequency can damage the grid and connected components.
In alternating current, there are three types of power. \
Real Power $P$ is the "visible force" that makes a motor run.
$ P = U dot I dot cos phi.alt $
Every conductor that carries power maintains an electric field. With alternating
currents, these fields are created and inverted 50 times a second, which requires its
own power. This power does not do actual, visible work, such as driving a motor; it
“works” only to maintain the EM field. \
This is called reactive power ($Q$).
$ Q = U dot I dot sin phi.alt $
Real and reactive power are shifted by the phase angle, denoted by φ. Coils and
conductors change this angle. \ 
Real and reactive power combined give the apparent power $S$:
$ S = U dot I = sqrt(P^2 + Q^2) $

A power flow study calculates how real and reactive power flow.
The nodes in a grid are called buses and can be classified into three types:
- Generators supply real power ($P$) and voltage ($V$); they are called #emph[PV buses].
- Load buses consume real and reactive power ($Q$); they are called #emph[PQ buses].
- At a special bus, called the slack bus, the voltage and phase angle are known; it is therefore the #emph[VD bus].

The study is based on Kirchhoff's Law stating that the sum of all currents at a node must be 0.
The flow of current is defined by the voltage difference between $i$ and its $k$-th neighbour as well as the admittance of the grid elements
between these two nodes.
$ underline(I)_i = sum_(k=1)^n underline(I)_(i k) = sum_(k=1)^n (underline(V)_i - underline(V)_k) underline(Y)_(i k)$

The equations can be reformulated to a matrix equation $I = Y dot V$, which constitutes a system of non-linear functions.
To solve this the Newton-Raphson method is often used -- especially in the case of power flow study.
The method iteratively refines an approximation:
$ x_(t+1) = x_t J_t^(-1) [y - f (x_i)] .$ @veithpower
