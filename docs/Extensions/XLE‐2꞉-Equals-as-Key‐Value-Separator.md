**Purpose:** Convenience; Extra Functionality; TOML Compatibility; INI Compatibility

**Description:** 
The equals character (`=`) can also be used universally to separate the key and value. 
However, mixing and matching the default character, colon (`:`), with an extension character (such as equals) is not recommended due to readability issues.

When enabled, this extension will cause the key and value to be separated based on the first `=` character, or the first `:` if there is no `=`.

**Created On**: May 15th, 2023

**Status:** Active

**Examples:** 

<table><tr>

<th>Original</th><th>Equals Sign</th><th>Mixed (Not Recommended)</th>

</tr><tr><td>

```yaml
servers: {
  alpha:  [10.0.0.2, My Home Server]
  bravo:  [10.0.0.7, My Work Server]
  charlie:[10.0.0.9, My Friend's Server]
  aux: {
    os        :  Ubuntu
    version   :  22.04 LTS
    start time:  14:03:59:10
  }
}
```  

</td><td>

```ini 
servers={
  alpha   = [10.0.0.2, My Home Server]
  bravo   = [10.0.0.7, My Work Server]
  charlie = [10.0.0.9, My Friend's Server]
  aux={
    os         =  Ubuntu
    version    =  22.04 LTS
    start time =  14:03:59:10
  }
}
```

</td><td>

```java
servers: {
  alpha   = [10.0.0.2, My Home Server]
  bravo   = [10.0.0.7, My Work Server]
  charlie = [10.0.0.9, My Friend's Server]
  aux: {
    os         =  Ubuntu
    version    =  22.04 LTS
    start time =  14:03:59:10
  }
}
```

</td></tr></table>