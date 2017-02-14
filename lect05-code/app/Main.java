package app;

import java.util.*;

class Main {

    public static void main(String[] args) {
        new Main().run("sample.db");
    }

    Database db = new Database();
    Scanner in = new Scanner(System.in);

    void run(String filename) {
        if (!db.openConnection(filename)) {
            System.out.println("Can't open database!");
            System.exit(1);
        }

        mainLoop:
        while (true) {
            System.out.println("================================================================");
            System.out.println("1. Show students");
            System.out.println("2. Show most common applications");
            System.out.println("0. Quit");
            System.out.print("What do you want to do: ");

            int cmd = in.nextInt(); in.nextLine();
            switch (cmd) {
            case 1:
                showStudents();
                break;
            case 2:
                showMostCommonApplications();
                break;
            case 0:
                System.out.println("Thanks, and goodbye!");
                break mainLoop;
            default:
                System.out.println("No idea what you're trying to do");
            }
        }
    }

    void showMostCommonApplications() {
        for (ApplicationCount ac : db.getApplicationCount()) {
            System.out.println(String.format("%4d: %s @ %s",
                                             ac.count,
                                             ac.major,
                                             ac.college));
        }
    }

    void showStudents() {
        for (StudentInfo s : db.studentInfo()) {
            System.out.println(String.format("%d: %s (%.2f)",
                                             s.studentId,
                                             s.studentName,
                                             s.gpa));
        }
    }
}
