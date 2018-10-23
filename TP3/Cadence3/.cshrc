set history=100
alias qu "quota -v"
limit coredumpsize 0
alias hh "history 30"
alias hi history 20
alias m more
alias gt "du -s * | more"
alias l ls -asF
alias ll ls -al
alias ll1 ls -asglrtF
alias ll2 ls -asgltF
alias lo logout 
alias cd 'cd \!*;set prompt="`hostname`::`pwd` "'
alias ds "ls -asF"
alias le less
setenv MANPATH "/usr/man:/usr/ucb/man:/usr/X11R6/man:/usr/openwin/man:/usr/local/man"
set path=(. ~ ~/bin /usr/openwin/bin /usr/X11R6/bin /usr/local/bin /usr/ucb /bin /usr/dt/bin /softs/acrobat7_0_1/bin /softs/mozilla /softs/OpenOffice1_12)
setenv LD_LIBRARY_PATH /usr/X11R6/lib:/usr/openwin/lib:/usr/lib
set filec
cd .

#
# CADENCE DFW II 2004 in AMS 3.70 environment 
#
#

unsetenv CDS_INST_DIR

setenv CDS_INST_DIR /softs/cdsic5_0_33
setenv CDSDIR  /softs/cdsic5_0_33
setenv CDSSE   /softs/cdsdsmse5_4
setenv LDVDIR '/softs/cdsldv5_0'
setenv ASSURAHOME /softs/cdsassu3_06

set path=($path \
$LDVDIR/tools/verilog/bin \
$LDVDIR/tools/simvisdai/bin \
$CDSDIR/tools.sun4v/dfII/bin \
$CDSDIR/tools.sun4v/bin \
$CDSSE/tools/dsm/bin \
$CDSSE/tools/pbs/bin \
$CDSSE/tools/pearl/bin \
$CDSSE/tools/dfII/bin \
$ASSURAHOME/tools/bin \
$ASSURAHOME/tools/assura/bin )

setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${ASSURAHOME}/tools/lib

setenv LM_LICENSE_FILE 5287@v211:5280@v212

#
# AMS 3.70 environment for CADENCE DFW II 2002 
#

setenv AMS_DIR  /softs/AMS_3.70_CDS

set path=($path $AMS_DIR/programs/bin $AMS_DIR/artist/bin)

setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:/softs/AMS_3.60_CDS/Flexlm/amslmd.lic

setenv  DD_DONT_DO_OS_LOCKS  set

######## Environnement pour Calibre ############
#setenv MGC_HOME /softs/calibre_2004_1_6/ss6_cal_2004.1_6.32
#set path=($path $MGC_HOME/bin )

#setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:1717@cime450
setenv MGC_HOME /softs/calibre2005_3_12/ss5_cal_2005.3_12.18
set path=($path $MGC_HOME/bin )

setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:1717@v212

#  (0.35 um 3LM) 0,35 cmos 
alias amsc35b3 'ams_cds -tech c35b3 -mode fb & '

#  (0.35 um 4LM) 0,35 cmos 
alias amsc35b4 'ams_cds -tech c35b4 -mode fb & '

#  (0.35 um BiCMOS 4LM) 0,35 SiGe
alias amss35d4 'ams_cds -tech s35d4 -mode fb & '

#  (0.80 um BiCMOS 4LM) 0,35 bicmos
alias cdsbyq 'ams_cds -tech byq -mode fb &'

#
# MENTOR GRAPHICS ModelSim version 5.7c in native environement
#

# setenv MGC_HOME /softs/idea2002
#setenv MTI_HOME /softs/adms1.7_1/modeltech
setenv MTI_HOME /softs/modelsim_6.3e/modeltech/

set path=($path $MTI_HOME/`$MTI_HOME/vco` )

setenv MGLS_LICENSE_FILE 1717@v212


setenv MODELSIM $HOME/nouvelles_configs/Projet_2A_telecom_etudiants/modelsim.ini


#
######################## Settings for Synopsys 2004.06 ########################
#
setenv SYNOPSYS /softs/synthesis2004_06_sp1
# setenv SYNOPSYS_SIM /softs/scirocco2002.12.1
setenv SNPSLMD_LICENSE_FILE 1721@v212
set path=($path /usr/bin/X11 $SYNOPSYS/sparcOS5/syn/bin)
setenv MANPATH ${MANPATH}:$SYNOPSYS/doc/license/man:$SYNOPSYS/doc/motif/man:$SYNOPSYS/doc/syn/man:$SYNOPSYS/doc/sim/man
# if (-e $SYNOPSYS_SIM/admin/setup/environ.csh) then
#    source $SYNOPSYS_SIM/admin/setup/environ.csh
# endif
######################## END: Settings for Synopsys 2004.06###################

######################## Settings for Design Vision Synopsys 2004.06###################

setenv PRINTER belledonne

#################################################
# commentaire ajoute car double setenv AMS_DIR
#################################################
# setenv AMS_DIR /softs/AMS_3.60_CDS
#################################################

# design_vision &



######################## END: Settings for Design Vision Synopsys 2004.06###################



################ Settings for Synopsys PrimePower 2004.06 ######################
setenv PPHOME /softs/primepower2004_06
set path=($path $PPHOME/sparcOS5/syn/bin)

setenv SNPSLMD_LICENSE_FILE 1721@v212
################# END: Settings for Synopsys PrimePower 2004.06 ###############

setenv PRINTER belledonne

#primepower&



################ Settings for Synopsys PrimeTime 2004.06 #######################
setenv QTHOME /softs/primetime2004_06
set path=($path $QTHOME/sparcOS5/syn/bin)

setenv SNPSLMD_LICENSE_FILE 1721@v212
################# END: Settings for Synopsys PrimeTime 2004.06 ################

rehash

#primetime &


#
################### Settings for Synopsys TetraMax 2004.06 #####################
#
setenv SYNOPSYS_TMAX /softs/tetramax2004_06_1
setenv SNPSLMD_LICENSE_FILE 1721@v212
set path=($path /usr/bin/X11 $SYNOPSYS_TMAX/bin )
############### End: Settings for Synopsys TetraMax 2004.06 ####################


#tmax&

xset b off
