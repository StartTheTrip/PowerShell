# Create a DLL file

$params = @{
    ReferencedAssemblies = [PowerShell].Assembly.Location
    OutputType           = 'Library'
    OutputAssembly       = 'output\wrapper.dll'
}
Add-Type @params -TypeDefinition @'
using System.Management.Automation;
using System.Management.Automation.Runspaces;

public class PSWrapper
{
    public static void RunPS(string json)
    {
        InitialSessionState initialSessionState = InitialSessionState.CreateDefault2();
        PowerShell psHost = PowerShell.Create(initialSessionState);
        psHost.AddCommand(@"input\commands.ps1").AddArgument(json).Invoke();
    }
}
'@