library(synapser)

# First time running synLogin, do:
# synLogin(authToken="<your synapse auth token>", rememberMe=TRUE)
synLogin()

# Example: synID <- "syn123"
synID <- "<synapse id of project or folder>"

# For all commands below, 'forceVersion = FALSE' means it won't update the
# version number of the file on Synapse if the file you're uploading is
# identical to the file already on Synapse.

#### To upload a single file:
file <- File(path = filename, parent = synID)
file <- synStore(file, forceVersion = FALSE)

#### To make a new folder inside the folder/project at <synID>
folder <- Folder("<foldername>", parent = synID)
folder <- synStore(folder, forceVersion = FALSE)

#### To upload all files in a folder to Synapse:
files <- list.files("<path to folder>", full.names = TRUE)
for (filename in files) {
  file <- File(path = filename, parent = synID) # or parent = folder, if you made a folder above
  file <- synStore(file, forceVersion = FALSE)
  print(paste0(file$properties$id, ": ", file$properties$name))
}
