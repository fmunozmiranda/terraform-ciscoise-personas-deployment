ise_username= "admin"
ise_password= "P@sbg1234"
ise_deployment= "large_deployment"
ise_base_hostname= "ISE-S"
ise_domain= "example.com"

# Variables common to all deployment types
pan1_ip="54.190.164.49" 
pan2_ip="34.220.79.8" 
pan2_local_ip="" 


# Additional variables for medium and large deployments

mnt1_ip="" 
mnt2_ip="" 
psn1_ip="10.0.0.12" 
psn2_ip="10.0.0.13" 
mnt1_local_ip="" 
mnt2_local_ip="" 
psn1_local_ip="" 
psn2_local_ip=""  

//for small deployment
# items =[ 
#     {
#         name = "ISE-S-server-psn-1"
#         ip = "54.190.164.49"
#         hostname = "ise-s-server-1"
#         roles=[]
#         services=[]
#     },
#     {
#         name = "ISE-S-server-psn-2"
#         ip = "34.220.79.8"
#         hostname = "ise-s-server-2"
#         roles=[]
#         services=[]
#     }
# ]

 
/*for medium deployment
items = [
    {
      name = "Ise PAN Server 1"
      ip = "10.0.0.0"
      hostname = "pan-server-1"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = "10.0.0.1"
      hostname = "pan-server-2"
      roles=["SecondaryAdmin","SecondaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 3"
      ip = "10.0.0.3"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 4"
      ip = "10.0.0.4"
      hostname = "psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
]
*/

/*for large deployment
items = [
    {
      name = "Ise PAN Server 1"
      ip = "10.0.0.0"
      hostname = "pan-server-1"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = "10.0.0.1"
      hostname = "pan-server-2"
      roles=["SecondaryAdmin","SecondaryMonitoring"]
      services=[]
    },
    {
      name = "Ise mnt Server 3"
      ip = "10.0.0.3"
      hostname = "mnt-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise mnt Server 4"
      ip = "10.0.0.4"
      hostname = "mnt-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 5"
      ip = "10.0.0.5"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = "10.0.0.6"
      hostname = "psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
]

itemsToRegister= [
    {
      name = "Ise PAN Server 1"
      ip = "10.0.0.0"
      hostname = "pan-server-1"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = "10.0.0.1"
      hostname = "pan-server-2"
      roles=["SecondaryAdmin"]
      services=[]
    },
    {
      name = "Ise mnt Server 3"
      ip = "10.0.0.3"
      hostname = "mnt-server-1"
      roles=["PrimaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 5"
      ip = "10.0.0.5"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = "10.0.0.6"
      hostname = "psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
]
*/