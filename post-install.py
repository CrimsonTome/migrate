from pyinfra import host
from pyinfra.facts.files import File
from pyinfra.facts.server import LinuxName
from pyinfra.operations import apt, server, dnf, files


os = host.get_fact(LinuxName)
print (os)


# why does this not work????
# username = host.get_fact(User)
username = str(server.shell("whoami"))
print(username)

hostname = host.get_fact(server.Hostname)
print(hostname)

# why does this not work????
# homeDir = host.get_fact(server.Home)

homeDir = str(server.shell("echo $HOME"))
print(homeDir)

# files.directory(
#     name="Ensure /home/username/git exists",
#     path=str(homeDir)+"/git",
#     user=username,
#     group=username,
# )

# files.directory(
#     name="Ensure /home/username/.config exists",
#     path=str(homeDir)+"/.config",
#     user=username,
#     group=username,
# )

# files.directory(
#     name="Ensure /home/username/.ssh exists",
#     path=str(homeDir)+"/.ssh",
#     user=username,
#     group=username,
# )
