Note: does not seem to actually fully work in GitHub Actions.

The install script does actually run to completion and Visio appears to be installed after.
However, attempting to actually open Visio as a COM object results in
```
Creating an instance of the COM component with CLSID {00021A20-0000-0000-C000-000000000046} from the
     | IClassFactory failed due to the following error: 80010001 Call was rejected by callee. (0x80010001
     | (RPC_E_CALL_REJECTED)).
```

This does not happen when tested inside a Windows Sandbox, and according to Copilot may have something to do with the fact that Visio and other Office applications will not run in a headless Windows environment.
