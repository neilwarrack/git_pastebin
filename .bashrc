# .bashrc

# ==== Source global definitions ====
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Git stuff
PATH=/home/ppe/n/nwarrack/local/bin:$PATH
export PATH
git config --global user.name "Neil Warrack"
git config --global user.email "neil.warrack@gmail.com"
git config --global core.editor "emacs"


# ==== User specific aliases and functions ====

alias l='ls -lrtFho | tail -10'


lsDirSizes(){

    du -sk * | sort -rn | \

    while read size entry; do

        # If the size is greater than 1048576, then it is at least 1 GB in size.                                                                                                                                  

        if [ "${size}" -gt 1048576 ]; then

            newSize=`echo "${size}000 / 1048576" | bc | sed -e "s/\(...\)$/\.\1/"`

            printf "% 10s %s\n" "${newSize} GB" "${entry}"

        # If the size is greater than 1024, then it is at least 1 MB in size.                                                                                                                                     

        elif [ "${size}" -gt 1024 ]; then

            newSize="$(echo ""${size}"000 / 1024" | bc | sed -e "s/\(...\)$/\.\1/")"

            printf "% 10s %s\n" ""${newSize}" MB" "${entry}"

        # If the size is anything else, then display the size in kb.                                                                                                                                              

        else

            printf "% 10s %s\n" "${size} kB" "${entry}"

        fi

    done

}


#source data/ppe01/sl5x/x86_
#source ~/lhcb-project-utils/setup-root.sh
#setup_root


# added by Miniconda2 installer
export PATH="/home/ppe/n/nwarrack/miniconda2/bin:$PATH"


# source run-pythia,Rivet,python-yoda etc
source ~/public_ppe/MC/env.sh  # NB: This sets a PYTHONHOME variable which sometimes gets in the way...


#setup ATLAS software
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
export ALRB_TutorialData=/home/ppe/n/nwarrack/ATLAS_SoftwareTutorial_Jan2018/tutorial/cern-jan2018
export RUCIO_ACCOUNT=nwarrack


#lsb_release -d # -d discription; use -a for all
#echo -e " "