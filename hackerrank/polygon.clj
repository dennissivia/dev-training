; r_i <= 1/2(r1+ ... + r_n)
    ; Scanner in = new Scanner(System.in);
    ; int n = in.nextInt();
    ; int a[] = new int[n];
    ; int cut = 0;
    ; for(int a_i=0; a_i < n; a_i++){
    ;     a[a_i] = in.nextInt();
    ; }
    ; Arrays.sort(a);
    ; for(int i=2;i<n;i++)
    ;     {
    ;         if(a[i-2]+a[i-1] <= a[i])
    ;             {
    ;             cut++;
    ;         }
    ; }
   ; System.out.println(cut);
