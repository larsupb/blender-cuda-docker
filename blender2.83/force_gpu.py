import bpy, _cycles
import sys

cuda_devices, opencl_devices = bpy.context.preferences.addons['cycles'].preferences.get_devices()
if len(cuda_devices) == 0:
    print('No CUDA devices found!', file=sys.stderr)
else:
    for card in cuda_devices:
       print('Found card ', card.name)
       if 'Tesla' in card.name:
           print('Set card.user = True for ', card.name)
           card.use = True
       else:
           print('skipping card.')
           card.use = False

prefs = bpy.context.preferences.addons['cycles'].preferences
prefs.compute_device_type = 'CUDA'

bpy.ops.wm.save_userpref()
