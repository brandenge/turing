# GitHub Steps

Describe in your own words how to establish a connection between a local repository and a remote repository on GitHub.

1) Navigate to the local git repository that you want to link to a remote.

2) Use the `git remote add <repo>` command locally in your terminal, where `<repo>` is the GitHub address of the remote repository that you want to link it to. Note that this is the same address used for cloning, and that HTTPS and SSH have slightly different addresses.

3) Test that the connection was made correctly by using the command `git remote -v`.
