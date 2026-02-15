#python version 3.13.7 was used for this.

# eulers method for z' = x - 2z, z(0) = 1


x = 0.0
z = 1.0 
h = 0.1

steps = 5

print(f"{'k':<5} {'x_k':<8} {'z_k':<8} {'f(x_k,z_k)':<12} {'f*h':<10} {'z_k+1':<8}")
print("-" * 60)

for k in range(steps):
    f = x - 2*z
    f_times_h = f*h
    next_z = z + f_times_h

    print(f"{k:<5} {x:<8.1f} {z:<8.4f} {f:<12.4f} {f_times_h:<10.4f} {next_z:<8.4f}")

    x = x + h
    z = next_z

print(f"{steps:<5} {x:<8.1f} {z:<8.4f}")