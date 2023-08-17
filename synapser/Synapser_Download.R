library(synapser)

# First time running synLogin, do:
# synLogin(authToken="<your synapse auth token>", rememberMe=TRUE)
synLogin()

# Example: synID <- "syn123"
synID <- "<synapse id of project, folder, or file>"

#### If synID is a single file:
synGet(synID, downloadLocation = "<file path to download to>")

#### If synID is a folder or project, this will download every file in the
#### folder (but will not recurse through folders inside it)
parent <- synGetChildren(synID)
parent <- parent$asList()

for (child in parent) {
  synGet(child$id, downloadLocation = "<file path to download to>")
}
