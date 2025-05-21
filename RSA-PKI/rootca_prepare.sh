#rootca_prepareca.sh

## Copy Directory names from [RootCA_default]
dir=/pki/rootca
certs=$dir/dircerts
csrdir=$dir/dircsrs
database=$dir/certs.db
serial=$dir/serial.db
## Copy crlnumber from [RootCA_default]
crlnumber=$dir/crlnumber.db

mkdir ${dir}
mkdir ${certs}
touch ${database}
mkdir ${csrdir}
echo 1000 > ${serial}
echo 1000 > ${crlnumber}