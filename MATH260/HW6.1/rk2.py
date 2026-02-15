# RK2 Midpoint Method for z' = x - 2z, z(0) = 1, h = 0.1

x = 0.0
z = 1.0
h = 0.1
steps = 5

print(f"{'k':<5} {'x_k':<8} {'z_k':<10} {'k1':<10} {'k2':<10} {'z_k+1':<10}")
print("-" * 60)

for k in range(steps):
    k1 = x - 2*z
    k2 = (x + h/2) - 2*(z + k1*h/2)
    z_next = z + k2*h
    
    print(f"{k:<5} {x:<8.1f} {z:<10.4f} {k1:<10.4f} {k2:<10.4f} {z_next:<10.4f}")
    
    x = x + h
    z = z_next

print(f"{steps:<5} {x:<8.1f} {z:<10.4f}")