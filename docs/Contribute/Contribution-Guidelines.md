Thanks for considering contributing to XSON! All contributions are appreciated! 

# Commit Messages
*To ensure consistency, any commits made to the main XSON repo must follow a standardized set of rules, detailed below:*

All commits to the main XSON repo or its wiki must have messages, and said messages must follow these guidelines:

- The first line should give a very brief description. This first line is required.
- Any extra or detailed information is optional but should be in a seperate paragraph.
- They must start with a first person singular present tense verb (e.g. Add, Update, Reorganize, Change).

**Examples:**

```
Add footer

Add a footer file containing a license disclaimer to the wiki
```
```
Create local docs folder

Migrate from having the docs folder be a wiki git submodule to being a copy and using github actions to publish to wiki
```
```
Fix contribute header in wiki sidebar
```

# Content Contributions
>*If you would like to contribute or suggest changes to the XSON base spec before it is fully released, 
feel free to open an [issue](../issues) with the correct template*

## Documentation

If you think you could **improve any of the documentation** in some way:

1) Create a [fork](../fork) of the main XSON repo
2) Make any changes to the documentation you want in your fork
3) Make a [pull request](../pulls) with the correct PR template, using your fork with your changes against the main XSON repo

## Extensions
To **request a feature/extension**, raise an [issue](../issues) for it with the correct issue template.

To **create an extension**:

1) Create a [fork](../fork) of the main XSON repo
2) Add your extension document under `docs/extensions/`, following the [extension template](XSON-Extension-Document-Template)
3) Make a [pull request](../pulls) with the correct PR template, using your fork with your changes against the main XSON repo

Similarly, to **create an extension set**:
1) Create a [fork](../fork) of the main XSON repo
2) Check to see if a suitable extension set already exists
   - If it does:
     1) Duplicate the document for the suitable extension set
     2) Increment the set version in this duplicate
     3) Change the extensions of the set to your liking, 
        but keep in mind the [extension set rules](XSON-Base-Specification#Extension-Sets);
        Mainly, you cannot remove exisitng functionality from an extension set
   - If not, add an extension set document under `docs/extension sets/`, 
     following the [extension set template](XSON-Extension-Set-Document-Template)
3) Make a [pull request](../pulls) with the correct PR template, using your fork with your changes against the main XSON repo

## Third Party Libraries
If you would like to **create a parser and/or generator for XSON** (i.e. a library),
you should refer to the [XSON Library Standardization](XSON-Standardized-Libraries-List#XSON-Library-Standardization) rules.
They also contain some general guidelines for creating a library.

To **get your library listed under the [XSON Libraries](XSON-Standardized-Libraries-List) list**, 
open a [pull request](../pulls) with the correct template.

# Donations
If you would like to **donate** to the XSON project, you can [donate through GitHub](../sponsor).

# Legal

All XSON repositories are under the "inbound = outbound" rule. 

In order words, any content you add to a repository will be licensed under the same terms as the repo's license
(in the case of the main XSON repo, it's the [CC-BY-SA-4.0 license](https://github.com/xson-lang/XSON/blob/main/LICENSE.txt)); 
You must also have the right to license this content under said terms.

By adding content/contributing to the XSON repo, you agree this ruling. 
Note that this is the explicit default in the [GitHub Terms of Service](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service#6-contributions-under-repository-license).