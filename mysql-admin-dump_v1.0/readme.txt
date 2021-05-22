##
##        Mod title:  Mysql Admin Dump
##
##      Mod version:  1.0
##  Works on FluxBB:  1.4
##     Release date:  2012-01-21
##      Review date:  YYYY-MM-DD (Leave unedited)
##           Author:  mer (meron1122@gmail.com)
##
##      Description:  Dump mysql database from PA
##
##
##   Affected files:  include/common_admin.php
##					  lang/your language/admin_common.php
##
##
##       Affects DB:  No
##
##            Notes:  I use MySQL Dump PHP class by Avram, avramyu@gmail.com
##
##       DISCLAIMER:  Please note that "mods" are not officially supported by
##                    FluxBB. Installation of this modification is done at 
##                    your own risk. Backup your forum database and any and
##                    all applicable files before proceeding.
##
##




#
#---------[ 1. COPY ]----------------------------------------------------
#
Copy from files to your fluxbb foder

#
#---------[ 2. OPEN ]----------------------------------------------------
#

include/common_admin.php



#
#---------[ 3. FIND ]----------------------------------------------------
#

<li<?php if ($page == 'ranks') echo ' class="isactive"'; ?>><a href="admin_ranks.php"><?php echo $lang_admin_common['Ranks'] ?></a></li>


#
#---------[ 4. After, ADD ]----------------------------------------------------
#

<li<?php if ($page == 'dump') echo ' class="isactive"'; ?>><a href="admin_dump.php"><?php echo $lang_admin_common['dump'] ?></a></li>



#
#---------[ 5. OPEN ]----------------------------------------------------
#

/lang/your language/admin_common.php


#
#---------[ 5. FIND ]----------------------------------------------------
#

);

#
#---------[ 6. Before, ADD ]----------------------------------------------------
#

//mysql dumper
'dump'					=> 'Backup Database',
