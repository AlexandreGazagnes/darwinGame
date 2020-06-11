#! /bin/sh


# create a run.sh
cd
touch run.sh
echo "git clone https://github.com/AlexandreGazagnes/theDarwinProject.git" >> run.sh
echo "cp -r theDarwinProject/infrastructure/sh/* ./" >> run.sh
echo "chmod +x *.sh" >> run.sh
echo "./boot.dev.sh" >> run.sh
chmod +x run.sh
rm -rf theDarwinProject

# do run
# ./run.sh