package com.test.java.file;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Temp {
   
   private static Scanner scan;
   private final static String DATA;
   
   private static List<Memo> list; //memo.dat의 대리자
   
   static {
      
      scan = new Scanner(System.in);
      DATA = "dat\\memo.dat";
      list = new ArrayList<Memo>();
      
   }
   
   public static void main(String[] args) {
      
      //Ex73_File.java
      
      /*
      
      어제: 파일입출력만 사용
      1. 정보 쓰기
         - BufferedWriter
      2. 정보 읽기
         - BufferedReader
      3. 정보 삭제하기
         - BufferedReader -> BufferedReader -> BufferedWriter
         
         
      오늘: 파일입출력(백업장치) + 컬렉션(주대상) 사용
      - 프로그램 시작: 파일 모든 내용 읽기 -> 메모리 저장(컬렉션)
      - 프로그램 사용: 메모리 조작(컬렉션)
      - 프로그램 종료: 메모리 저장(컬렉션) -> 파일 모든 내용 쓰기
      
      [콘솔 메모장]
      
      기능
      1. 메모 쓰기
      2. 메모 읽기
      3. 메모 삭제하기
      
      데이터
      1. 메모
         e. 번호(숫자) - 유일한 값(식별자)
         a. 작성자(문자열)
         b. 메모내용(문자열..)
            - 한줄 메모
            - 여러줄 메모(v)
         c. 날짜(2021-04-30 12:00:00)
         d. 중요도(A,B,C)
      2. 파일
         - memo.dat
      3. 형식
         번호,이름,날짜,중요도
         메모내용
         ==========
      
      */
      
      
      load();//텍스트파일 -> 배열
      
      System.out.println(list);
      
      
      System.out.println("[메모장]");
      
      boolean loop = true;
      
      while (loop) {
         
         //메뉴
         //선택
         //분기
         String sel = menu();
         
         if (sel.equals("1")) {
            add();
         } else if (sel.equals("2")) {
            list();
         } else if (sel.equals("3")) {
            delete();
         } else {
            loop = false;
         } 
         
      }//while
      
      System.out.println("메모장을 종료합니다.");
      
      
   }//main
   
   
   private static void load() {
      
      //BufferedReader
      // - memo.dat -> ArrayList<Memo> list
      
      try {
         
         BufferedReader reader = new BufferedReader(new FileReader(DATA));
         
         String line = "";
         
         while ((line = reader.readLine()) != null) {
            
            //Memo 객체 1개 생성
            Memo memo = new Memo();
            
            //2,아무개,2021-03-26 17:15:05,B
            //퇴근때 마트 장보기
            //돼지고기,상추,쌈장
            //==========
            
            String[] temp = line.split(",");
            
            memo.setSeq(temp[0]);
            memo.setName(temp[1]);
            memo.setRegdate(temp[2]);
            memo.setPriority(temp[3]);
            
            
            //메모 내용 읽기
            String tempContent = "";
            
            while (!(line = reader.readLine()).equals("==========")) {
               tempContent += line + "\r\n";
            }
            
            memo.setContent(tempContent);
            
            //메모 1건 -> Memo 객체 1개에 옮겨 담기
            
            list.add(memo);            
            
         }//while
         
         reader.close();
         
      } catch (Exception e) {
         System.out.println("load: " + e);
      }
      
      
      
   }


   private static void delete() {
      
      System.out.println("[메모 삭제하기]");
      
      pause();      
   }


   private static void list() {
      
      System.out.println("[메모 읽기]");
      
      pause();      
   }


   private static void add() {
      
      System.out.println("[메모 쓰기]");
      
      pause();
   }


   private static String menu() {
      
      System.out.println("===================");
      System.out.println("1. 메모 쓰기");
      System.out.println("2. 메모 읽기");
      System.out.println("3. 메모 삭제하기");
      System.out.println("4. 종료");
      System.out.println("===================");
      System.out.print("선택: ");
      
      String sel = scan.nextLine();
      
      return sel;
   }
   
   private static void pause() {
      System.out.println("엔터를 누르시면 다음으로 진행합니다.");
      scan.nextLine();//Block
   }

}
























































