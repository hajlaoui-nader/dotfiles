##### SBT
alias newScalaProject='sbt new scala/scala-seed.g8'

# Skeleton
alias scalaAppSkeleton='mkdir app &                           
touch app/docker-compose.yml &
mkdir modules                 &       
mkdir modules/core             &      
mkdir modules/core/src          &     
mkdir modules/core/src/main      &   
mkdir modules/core/src/main/resources &
mkdir modules/core/src/main/scala    &
mkdir modules/tests/                 &
mkdir modules/tests/src              &
mkdir modules/tests/src/test         &
mkdir modules/tests/src/test/scala   &
mkdir modules/tests/src/main         &
mkdir modules/tests/src/main/scala   &
touch modules/core/src/main/scala/Main.scala'
