This directory explains how to adapt the DPI-C transactor to a vendor co-simulation API
(Palladium, Veloce, Protium, etc.). Replace the printf in transactor.c with calls to
the vendor library that sends/receives transactions to/from the hardware/emulator.
