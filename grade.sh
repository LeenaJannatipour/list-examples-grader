CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
        echo 'ListExamples.java found'
    else 
            echo 'ListExamples.java not found'
            echo 'Score: 0/4'
            exit 1
fi
#copy files in student submission into grading area
cp student-submission/ListExamples.java ./grading-area

cp TestListExamples.java ./grading-area

javac -cp $CPATH grading-area/*.java

if [[ $? -ne 0 ]]
then
        echo 'Files not compiling'
        echo 'Score: 0/4'
        exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junit-output.txt 
cat junit-output.txt

