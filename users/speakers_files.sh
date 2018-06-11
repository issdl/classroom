#!/bin/bash -x

C=/opt/issdl/classes

mkdir -p $C/c1
mkdir -p $C/c2
mkdir -p $C/c3
mkdir -p $C/c4
mkdir -p $C/c5
mkdir -p $C/c6
mkdir -p $C/c7
mkdir -p $C/c8
mkdir -p $C/c9
mkdir -p $C/c10
mkdir -p $C/c11
mkdir -p $C/c12
mkdir -p $C/c13
mkdir -p $C/c14

mkdir -p $C/kn1
mkdir -p $C/kn2
mkdir -p $C/kn3
mkdir -p $C/kn4
mkdir -p $C/kn5
mkdir -p $C/kn6
mkdir -p $C/kn7
mkdir -p $C/kn8
mkdir -p $C/kn9
mkdir -p $C/kn10

chgrp -R speakers /opt/issdl/classes
chmod -R g+rwx /opt/issdl/classes

D=/home/speakers

function ga(){
  groupadd speakers-$1
  usermod -a -G speakers-$1 $2
  ln -sfn $C/$1 $D/$2/$1
  chown -R $2:speakers-$1 $C/$1
}

ga kn1 rhinsche
#ln -sf $C/kn1	$D/rhinsche/kn1

ga c1 jruminski
#ln -sf $C/c1	$D/jruminski/c1

ga kn2 vklimkov
#ln -sf $C/kn2	$D/vklimkov/kn2

ga c2 akwasniewska
#ln -sf $C/c2	$D/akwasniewska/c2

ga c3 mszankin
#ln -sf $C/c3	$D/mszankin/c3

ga kn3 gkardara
#ln -sf $C/kn3	$D/gkardara/kn3

ga c4 khjo
ga c4 lkurnianggoro
#ln -sf $C/c4	$D/khjo/c4
#ln -sf $C/c4	$D/lkurnianggoro/c4

ga kn4 jcychnerski
#ln -sf $C/kn5	$D/jcychnerski/kn5

ga c5 yhui
ga c5 xcai
#ln -sf $C/c5	$D/yhui/c5
#ln -sf $C/c5	$D/xcai/c5

ga c6 jczaja
ga c6 kbinias
#ln -sf $C/c6	$D/jczaja/c6
#ln -sf $C/c6	$D/kbinias/c6

ga kn5 rnicolas
#ln -sf $C/kn5	$D/rnicolas/kn5

ga c7 mmaity
#ln -sf $C/c7	$D/mmaity/c7

ga kn6 acanziani
#ln -sf $C/kn6	$D/acanziani/kn6

ga c8 acanziani
#ln -sf $C/c8	$D/acanziani/c8

ga c9 kdraszawka
#ln -sf $C/c9	$D/kdraszawka/c9

ga kn7 mmanic
ga kn7 kamarasinghe
#ln -sf $C/kn7	$D/mmanic/kn7
#ln -sf $C/kn7	$D/kamarasinghe/kn7

ga c10 tstachlewski
#ln -sf $C/c10	$D/tstachlewski/c10

ga kn8 mmaity
#ln -sf $C/kn8	$D/mmaity/kn8

ga c11 isobieraj
#ln -sf $C/c11	$D/isobieraj/c11

ga c12 kczuszynski
#ln -sf $C/c12	$D/kczuszynski/c12

ga kn9 khjo
ga kn9 lkurnianggoro
#ln -sf $C/kn9	$D/khjo/kn9
#ln -sf $C/kn9	$D/lkurnianggoro/kn9

ga c13 pjanuszewski
#ln -sf $C/c13	$D/pjanuszewski/c13
#
ga kn10 yhui
ga kn10 xcai
#ln -sf $C/kn10	$D/yhui/kn10
#ln -sf $C/kn10	$D/xcai/kn10

ga c14 prosciszewski
#ln -sf $C/c14	$D/prosciszewski/c14

