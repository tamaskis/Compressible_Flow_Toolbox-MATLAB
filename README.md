`inverse_normal_shock`
======================

Determines the Mach number upstream of a normal shock given some input quantity.

[Back to Compressible Flow Toolbox Contents](Compressible_Flow_Toolbox_Contents.html)

Contents
--------

-   [Syntax](#1)
-   [Description](#2)
-   [Input/Output Parameters](#3)
-   [Examples](#4)
-   [See also](#19)

Syntax
------

``` {.language-matlab}
M1 = inverse_normal_shock(M2,gamma,'M2')
M1 = inverse_normal_shock(T2_T1,gamma,'T2/T1')
M1 = inverse_normal_shock(P2_P1,gamma,'P2/P1')
M1 = inverse_normal_shock(rho2_rho1,gamma,'rho2/rho1')
M1 = inverse_normal_shock(U2_U1,gamma,'U2/U1')
M1 = inverse_normal_shock(a2_a1,gamma,'a2/a1')
M1 = inverse_normal_shock(h2_h1,gamma,'h2/h1')
M1 = inverse_normal_shock(Tt2_Tt1,gamma,'Tt2/Tt1')
M1 = inverse_normal_shock(Pt2_Pt1,gamma,'Pt2/Pt1')
M1 = inverse_normal_shock(rhot2_rhot1,gamma,'rhot2/rhot1')
M1 = inverse_normal_shock(at2_at1,gamma,'at2/at1')
M1 = inverse_normal_shock(ht2_ht1,gamma,'ht2/ht1')
M1 = inverse_normal_shock(ds_cp,gamma,'(s2-s1)/cp')
```

Description
-----------

`M1 = inverse_normal_shock(Q_in,gamma,Q_spec)` returns the Mach number `M1` upstream of a normal shock given an input quantity `Q_in`, specified by the char array `Q_spec`, and the specific heat ratio `gamma`. `Q_spec` can take on the following values:

-   `'M2'` = downstream Mach number
-   `'T2/T1'` = static temperature ratio
-   `'P2/P1'` = static pressure ratio
-   `'rho2/rho1'` = static density ratio
-   `'U2/U1'` = velocity ratio
-   `'a2/a1'` = speed of sound ratio
-   `'h2/h1'` = static enthalpy ratio
-   `'Tt2/Tt1'` = stagnation temperature ratio
-   `'Pt2/Pt1'` = stagnation pressure ratio
-   `'rhot2/rhot1'` = stagnation density ratio
-   `'at2/at1'` = stagnation speed of sound ratio
-   `'ht2/ht1'` = stagnation enthalpy ratio
-   `'(s2-s1)/cp'` = nondimensional entropy change

**NOTE:** The input quantity `Q_in` can be a scalar or a vector.

Input/Output Parameters
-----------------------

||
|**Input Parameter**|**Size/Type**|**Description**|
|`Q_in`|N×1 or 1×N double|input quantity|
|`gamma`|1×1 double|specified heat ratio|
|`Q_spec`|1×1 char|specifies input quantity|

||
|**Output Parameter**|**Size/Type**|**Description**|
|`M1`|N×1 or 1×N double|upstream Mach number|

Examples
--------

*Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from all quantities/ratios across a normal shock in air (![\$\\gamma=1.4\$](inverse_normal_shock_documentation_eq17585610266604048686.png)). Note that all values are taken from the examples in the [`normal_shock`](normal_shock_documentation.html) documentation.*

Set ![\$\\gamma\$](inverse_normal_shock_documentation_eq17096441642737911057.png).

``` {.codeinput}
gamma = 1.4;
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from downstream Mach number (![\$M\_{2}\$](inverse_normal_shock_documentation_eq10443026409667414366.png)).

``` {.codeinput}
M2 = inverse_normal_shock(0.4752,gamma,'M2')
```

``` {.codeoutput .error}
Undefined function 'inverse_normal_shock' for input arguments of type 'double'.

Error in inverse_normal_shock_documentation (line 68)
M2 = inverse_normal_shock(0.4752,gamma,'M2')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from static temperature ratio (![\$T\_{2}/T\_{1}\$](inverse_normal_shock_documentation_eq12553088108111122839.png)).

``` {.codeinput}
T2_T1 = inverse_normal_shock(2.6790,gamma,'T2/T1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from static pressure ratio (![\$P\_{2}/P\_{1}\$](inverse_normal_shock_documentation_eq05618693213234080270.png)).

``` {.codeinput}
P2_P1 = inverse_normal_shock(10.3333,gamma,'P2/P1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from static density ratio (![\$\\rho\_{2}/\\rho\_{1}\$](inverse_normal_shock_documentation_eq01258411689976535246.png)).

``` {.codeinput}
rho2_rho1 = inverse_normal_shock(3.8571,gamma,'rho2/rho1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from velocity ratio (![\$U\_{2}/U\_{1}\$](inverse_normal_shock_documentation_eq17914656599505253673.png)).

``` {.codeinput}
U2_U1 = inverse_normal_shock(0.2593,gamma,'U2/U1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from speed of sound ratio (![\$a\_{2}/a\_{1}\$](inverse_normal_shock_documentation_eq00795990486375567221.png)).

``` {.codeinput}
a2_a1 = inverse_normal_shock(1.6368,gamma,'a2/a1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from static enthalpy ratio (![\$h\_{2}/h\_{1}\$](inverse_normal_shock_documentation_eq08456106468505353404.png)).

``` {.codeinput}
h2_h1 = inverse_normal_shock(0.3733,gamma,'h2/h1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from stagnation temperature ratio (![\$T\_{t2}/T\_{t1}\$](inverse_normal_shock_documentation_eq12243403514466805918.png)).

``` {.codeinput}
Tt2_Tt1 = inverse_normal_shock(1,gamma,'Tt2/Tt1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from stagnation pressure ratio (![\$P\_{t2}/P\_{t1}\$](inverse_normal_shock_documentation_eq14474435715151125360.png)).

``` {.codeinput}
Pt2_Pt1 = inverse_normal_shock(0.3283,gamma,'Pt2/Pt1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from stagnation density ratio (![\$\\rho\_{t2}/\\rho\_{t1}\$](inverse_normal_shock_documentation_eq04552293313725137028.png)).

``` {.codeinput}
rhot2_rhot1 = inverse_normal_shock(0.3283,gamma,'rhot2/rhot1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from stagnation speed of sound ratio (![\$a\_{t2}/a\_{t1}\$](inverse_normal_shock_documentation_eq02759985136035125752.png)).

``` {.codeinput}
at2_at1 = inverse_normal_shock(1,gamma,'at2/at1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from stagnation enthalpy ratio (![\$h\_{t2}/h\_{t1}\$](inverse_normal_shock_documentation_eq08351279650148753391.png)).

``` {.codeinput}
ht2_ht1 = inverse_normal_shock(1,gamma,'ht2/ht1')
```

Upstream Mach number (![\$M\_{1}\$](inverse_normal_shock_documentation_eq15881875510505807195.png)) from nondimensional entropy change (![\$(s\_{2}-s\_{1})/c\_{p}\$](inverse_normal_shock_documentation_eq14193543475150949851.png)).

``` {.codeinput}
ds_cp = inverse_normal_shock(1,gamma,'(s2-s1)/cp')
```

See also
--------

[`normal_shock`](normal_shock_documentation.html) | [`flownormalshock`](matlab:doc('flownormalshock')).

[Published with MATLAB® R2021a](https://www.mathworks.com/products/matlab/)

