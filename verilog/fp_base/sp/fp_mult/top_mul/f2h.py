import struct

def f2h(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])
