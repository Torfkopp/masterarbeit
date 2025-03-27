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

// === Power Flow Analysis

// Power flow analysis is a primary way to study power systems and helps in continuous monitoring of the power system's current state.
// The objective of power flow calculations is to determine the steady-state operating characteristics of the power system for a given load and a generator's real power and voltage conditions. This information can be used to calculate real and reactive power flow in all branches of the power system together with power losses.

// #figure(
//     image("/images/power_triangle.png", width: 40%),
//     caption:  [Power Triangle showing the relationship between \ the powers in a power grid. #footnote("https://i.sstatic.net/BxdIS.gif")]
// )

// The nodes in a power grid are called buses. There are three types of buses in a power grid:
// #heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Slack Bus]
// There is only one slack bus in the system. The voltage magnitude and phase angle are known at this bus, whilst the real power and reactive power are unknown. The slack bus must have a source of both real and reactive power.

// #heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Generator Bus]
// Also called PV buses, are buses for which the voltage magnitude and the injected real power are specified.
// Hence, a variable source of reactive power such as generator must be connected to the bus.

// #heading(outlined: false, bookmarked: false, level: 5, numbering: none)[Load Bus]
// Also called PQ buses, are buses for which the real power and reactive power are specified.



// - load-flow study or power-flow study is needed to determine the steady-state operating conditions of a power system.
// - The objective of load flow calculations is to determine the steady-state operating characteristics of the power system for a given load and a generator's real power and voltage conditions. This information can be used to calculate real and reactive power flow in all branches of the power system together with power losses.
// - the buses are the nodes in the power grid; each bus in the system is characterised by four main variables: voltage magnitude, voltage angle, real power and reactive power; they can be classified into three types: 
//  - Load buses, without any generators; also known as PQ buses, because real power and reactive power are assumed to be known,
//  - Generator buses, that have at least one generator connected; also known as PV buses, because real power and voltage magnitude are known,
//  - Slack buses, arbitrarily selected buses with generator; voltage magnitude and phase angle are known
// - load flow calculates the unknown 
// - 
// - The active power (in watts (W)) represents the actual power consumed by the load. Its formula is $P = V x I x cos theta$,
// where $P$ is the active power, $V$ is the voltage, $I$ is the current, and $theta$ is the phase angle between voltage and current.
// - The reactive power (volt-amperes reactive (VAR)) is the power that oscillates between the source and reactive components, such as inductors and capacitors, to maintain the electromagnetic field. Its formula is $Q = V x I x sin theta$,
// - The apparent power (volt-amperes (VA)) combines both active and reactive power, representing the total power in the circuit; it is the vector sum of $P$ and $Q$ and is calculated as $S = sqrt(P^2 + Q^2)$ or alternatively $S = V x I$. @moulin2002measuring


// Phase angle $delta$
// voltage $V$

// The flow of the active and reactive powers in a power grid is called 'load flow'.

// There are three kinds of buses in a power grid:
// + Generator Bus (P-V bus): 
// + Load Bus (P-Q bus):
// + Slack Bus:



// Load flow study is a numerical analysis of the flow of electric power in any electrical system. It is used to determine the steady-state operating conditions of a power system, including voltages, currents, and power flows. 


// The load flow calculation is based on the Kirchhoff's current law (KCL) and Kirchhoff's voltage law (KVL) equations, which are solved iteratively to converge to a solution. 

// - p
// - q
// - Load flow calculation
// - active power
// - reactive power
// - P, Q, V in distribution networks