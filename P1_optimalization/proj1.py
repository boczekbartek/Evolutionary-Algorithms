from scipy import optimize as op
import numpy as np

def rosen(x):
   """The Rosenbrock function"""
   return sum(100.0*(x[1:]-x[:-1]**2.0)**2.0 + (1-x[:-1])**2.0)

x0 = np.array([1.3, 0.7, 0.8, 1.9, 1.2])
res = op.minimize(rosen, x0, method='Newton-CG',jac=None,options={'xtol': 1e-8, 'disp': True})

print(res.x)