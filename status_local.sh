
echo "--------------------------------Status of `hostname -i`-------------------------------------------"
echo "----------------cs----------------"
/home/aikbs/bin/csCTRL.sh
echo "---------------kbs----------------"
/home/aikbs/bin/kbsCTRL.sh
echo "----------------memcached---------"
/home/aikbs/bin/csMCCTRL.sh
echo "--------------------------------------------------------------------------------------------------"
echo "----------------staircs----------------"
/home/aikbs/bin/stairCSCTRL.sh
echo "---------------stairkbs----------------"
/home/aikbs/bin/stairKBSCTRL.sh
echo "----------------stairmemcached---------"
/home/aikbs/bin/stairCSmcCTRL.sh
echo "--------------------------------------------------------------------------------------------------"


