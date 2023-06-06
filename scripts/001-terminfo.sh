install_dir=$(dirname $0)/terminfo

for t in `ls ${install_dir}/terms`; do
    tic -x "${install_dir}/terms/$t"
done
