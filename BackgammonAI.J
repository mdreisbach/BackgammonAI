// BackgammonAI
// Programmed AI uses a mini-max with expectimax on a 1-ply depth tree and determines the best possible move given the state of the board
public class GlobalMembers
{
	public static int behaviorcheck(int[] array)
	{
		int i;
		int cnt = 0;
		for (i = 1;i <= 18;i++)
		{
			if (array2[i] > 0)
			{
				return 0;
			}
		}
		return 1;
	}
	public static int[] array1 = new int[30];
	public static int[] array2 = new int[30];
	public static int[] array3 = new int[30];
	public static int[] array4 = new int[30];
	public static int[] array5 = new int[30];
	public static int[] array6 = new int[30];
	public static int[] array7 = new int[30];
	public static int[] array8 = new int[30];
	public static void copyit(int[] a, int[] b)
	{
		int i;
		for (i = 1;i <= 26;i++)
		{
			a[i] = b[i];
		}
	}
	public static int evalfunc(int[] a)
	{
		int calc;
		int i;
		int pip;
		int my_blot;
		int enemy_blot;
		int enemy_bar;
		int holding;
		int anchor;
		int white_checker = 0;
		i = pip = my_blot = enemy_blot = enemy_bar = holding = anchor = 0;
		for (i = 1;i <= 24;i++)
		{
			if (a[i] > 0)
			{
				pip += a[i] * (24 - i);
				if (a[i] == 1)
				{
					my_blot += 1;
				}
				if (i <= 18)
				{
					holding += a[i] * (18 - i);
				}
				if (a[i] >= 2)
				{
					anchor++;
				}
				white_checker++;
			}
			else if (a[i] == -1)
			{
				enemy_blot += 1;
			}
		}
		if (a[26] > 0)
		{
			enemy_bar += a[26];
		}
		calc = 10 * enemy_blot + 800 * enemy_bar - 400 * holding + 80 * anchor - 200 * pip - 50 * (my_blot) - 1500 * white_checker;
		return calc;
	}
	public static int checkmove(int[] array5, int d1, int d2)
	{
		int flag = 1;
		int pointit;
		int x;
		pointit = 1;
		if (array5[0] >= 1)
		{
			if (!(array1[d1] >= -1 || array1[d2] >= -1))
			{
				return 0;
			}
		}
		else
		{
			while (pointit <= 24)
			{
				if (array1[pointit + d1] >= -1 || array1[pointit + d2] >= -1)
				{
					return 1;
				}
				pointit++;
			}
		}
		return 0;
	}
	public static int bearmaxit(int[] array1it)
	{
		int i;
		for (i = 19;i <= 24;i++)
		{
			if (array1[i] > 0)
			{
				return i;
			}
		}
	}
	public static int[] p1 = new int[40];
	public static int[] p2 = new int[40];
	public static int[] p3 = new int[40];
	public static int[] p4 = new int[40];
	public static int[] p5 = new int[40];
	public static int returnmin(int[] array5, int d1, int d2)
	{
		int ans = 0;
		int cnt;
		int x;
		int flagit2;
		int pointit = 1;
		int max = 1000000000;
		int lenit = 0;
		int val;
		int pos = -1;
		int i;
		int j;
		int da;
		int dp;
		int flagit3 = 1;
		int flagit4 = 1;
		copyit(array6, array5);
		if (array6[0] > 1)
		{
			if (array6[d1] >= -1 && array6[d2] >= -1)
			{
				copyit(array7, array6);
				if (array6[d1] == -1)
				{
					array6[0]--;
					array6[d1] = 1;
					array6[26]++;
				}
				else
				{
					array6[0]--;
					array6[d1]++;
				}
				if (array6[d2] == -1)
				{
					array6[0]--;
					array6[d2] = 1;
					array6[26]++;
				}
				else
				{
					array6[0]--;
					array6[d2]++;
				}
				p1[lenit] = 0;
				p2[lenit] = d1;
				p3[lenit] = 0;
				p4[lenit] = d2;
				val = evalfunc(array6);
				p5[lenit] = val;
				lenit++;
				if (val < max)
				{
					max = val;
					pos = lenit - 1;
				}
				copyit(array6, array7);

				copyit(array7, array6);
				if (array6[d1 + d2] >= -1)
				{
					if (array6[d1 + d2] == -1)
					{
						array6[0]--;
						array6[d1 + d2] = 1;
						array6[26]++;
					}
					else
					{
						array6[0]--;
						array6[d1 + d2]++;
					}
					p1[lenit] = 0;
					p2[lenit] = d1;
					p3[lenit] = d1;
					p4[lenit] = d2;
					val = evalfunc(array6);
					p5[lenit] = val;
					lenit++;
					if (val < max)
					{
						max = val;
						pos = lenit - 1;
					}
				}
				copyit(array6, array7);
				return max;
			}
			else if (array6[d1] >= -1 || array6[d2] >= -1)
			{
				if (array6[d1 + d2] >= -1)
				{
					if (array6[d1 + d2] == -1)
					{
						array6[0]--;
						array6[d1 + d2] = 1;
						array6[26]++;
					}
					else
					{
						array6[0]--;
						array6[d1 + d2]++;
					}
					p1[lenit] = 0;
					p2[lenit] = d2;
					p3[lenit] = d2;
					p4[lenit] = d1 + d2;
					p5[lenit] = evalfunc(array6);
					if (array6[d1] >= -1)
					{
						p1[lenit] = 0;
						p2[lenit] = d1;
						p3[lenit] = d1;
						p4[lenit] = d1 + d2;
					}
					return p5[lenit];
				}
				if (array6[d1] >= -1)
				{
					p1[lenit] = 0;
					p2[lenit] = d1;
					if (array6[d1] == -1)
					{
						array6[0]--;
						array6[d1] = 1;
						array6[26]++;
					}
					else
					{
						array6[0]--;
						array6[d1]++;
					}
					return evalfunc(array6);
				}
				else if (array6[d2] >= -1)
				{
					p1[lenit] = 0;
					p2[lenit] = d2;
					if (array6[d2] == -1)
					{
						array6[0]--;
						array6[d2] = 1;
						array6[26]++;
					}
					else
					{
						array6[0]--;
						array6[d2]++;
					}
					return evalfunc(array6);
				}
			}
			else if (array6[d1] < -1 && array6[d2] < -1)
			{
				return 1000000000;
			}
		}
		else if (array6[0] == 1)
		{
			if (array6[d1] < -1 && array6[d2] < -1)
			{
				return 1000000000;
			}
			cnt = 2;
			while (cnt-- != 0)
			{
				copyit(array7, array6);
				da = d1;
				dp = d2;
				if (cnt == 0)
				{
					da = d2;
					dp = d1;
				}
				if (array6[da] >= -1)
				{
					flagit2 = 1;
					if (array6[da] == -1)
					{
						array6[da] = 1;
						array6[26]++;
						array6[0]--;
					}
					else
					{
						array6[da]++;
						array6[0]--;
					}
					for (j = 1;j <= 24;j++)
					{
						copyit(array8, array6);
						if (array6[j] <= 0)
						{
							continue;
						}
						if (array6[j + dp] >= -1 && j + dp <= 24)
						{
							flagit2 = 0;
							if (array6[j + dp] == -1)
							{
								if (j + dp <= 24)
								{
									array6[j + dp] = 1;
								}
								array6[j]--;
								array6[26]++;
							}
							else
							{
								if (j + dp <= 24)
								{
									array6[j + dp]++;
								}
								array6[j]--;
							}
							p1[lenit] = 0;
							p2[lenit] = da;
							p3[lenit] = j;
							p4[lenit] = j + dp;
							val = evalfunc(array6);
							p5[lenit] = val;
							if (val < max)
							{
								max = val;
								pos = lenit;
							}
							lenit++;
						}
						copyit(array6, array8);
					}
					if (flagit2 != 0)
					{
						p1[lenit] = 0;
						p2[lenit] = da;
						array6[25] = 1;
						val = evalfunc(array6);
						p5[lenit] = val;
						if (val < max)
						{
							max = val;
							pos = lenit;
						}
						lenit++;
					}
				}
				copyit(array6, array7);
			}
			if (pos == -1)
			{
				return 1000000000;
			}
			return p5[pos];
		}
		while (pointit <= 24)
		{
			if (array6[pointit] <= 0)
			{
				pointit++;
				continue;
			}
			cnt = 2;
			if (d1 == d2)
			{
				cnt = 1;
			}
			x = pointit;
			while (cnt-- != 0)
			{
				da = d1;
				dp = d2;
				if (cnt == 0)
				{
					da = d2;
					dp = d1;
				}
				copyit(array7, array6);
				if ((array6[pointit + da] >= -1 && pointit + da <= 24) || (behaviorcheck(array6) != 0 && pointit + da >= 25 && flagit3 == 1))
				{
					if (behaviorcheck(array6) != 0 && pointit + da >= 25 && flagit3 == 1)
					{
						flagit3 = 0;
					}
					flagit2 = 1;
					if (array6[pointit + da] == -1)
					{
						array6[pointit]--;
						if (pointit + da <= 24)
						{
							array6[pointit + da] = 1;
						}
						array6[26] += 1;
					}
					else
					{
						array6[pointit]--;
						if (pointit + da <= 24)
						{
							array6[pointit + da]++;
						}
					}
					x = pointit;
					while (x <= 24)
					{
						copyit(array8, array6);
						if (array6[x] > 0)
						{
							if ((array6[x + dp] >= -1 && x + dp <= 24) || (behaviorcheck(array6) != 0 && x + dp >= 25 && flagit4 == 1))
							{
								if (behaviorcheck(array6) != 0 && x + dp >= 25 && flagit4 == 1)
								{
									flagit4 = 0;
								}
								flagit2 = 0;
								if (array6[x + dp] == -1)
								{
									array6[x]--;
									if (x + dp <= 24)
									{
										array6[x + dp] = 1;
									}
									array6[26] += 1;
								}
								else
								{
									array6[x]--;
									if (x + dp <= 24)
									{
										array6[x + dp]++;
									}
								}
								p1[lenit] = pointit;
								p2[lenit] = pointit + da;
								p3[lenit] = x;
								p4[lenit] = x + dp;
								val = evalfunc(array6);
								p5[lenit] = val;
								lenit++;
								if (val < max)
								{
									max = val;
									pos = lenit - 1;
								}
								ans++;
							}
						}
						x++;
						copyit(array6, array8);
					}
					if (flagit2 != 0)
					{
						p1[lenit] = pointit;
						p2[lenit] = pointit + da;
						p3[lenit] = -1;
						p4[lenit] = -1;
						array6[25] = 1;
						val = evalfunc(array6);
						p5[lenit] = val;
						if (val < max)
						{
							max = val;
							pos = lenit;
						}
						lenit++;
					}
					copyit(array6, array7);
				}
				else
				{
					copyit(array6, array7);
					continue;
				}
			}
			pointit++;
		}
		if (pos == -1)
		{
			return 1000000000;
		}
	return p5[pos];
	}
	public static int level2(int[] array4)
	{
		int temp;
		int i;
		int j;
		int sum = 0;
		int cnt = 0;
		copyit(array5, array4);
		for (i = 1;i <= 12;i++)
		{
			temp = array5[i];
			array5[i] = array5[25 - i];
			array5[25 - i] = temp;
			array5[i] *= -1;
			array5[25 - i] *= -1;
		}
		temp = array5[0];
		array5[0] = array5[26];
		array5[26] = temp;
		for (i = 1;i <= 6;i++)
		{
			for (j = i;j <= 6;j++)
			{
				sum = sum + returnmin(array5, i, j);
				cnt++;
			}
		}
		if (array5[25] == 1)
		{
			sum -= 50000;
		}
		return (sum / cnt);
	}
	public static void printit(int a,int b,int c,int d, int flagit)
	{
		int state1;
		int state2;
		int state3;
		int state4;
		byte ch1 = (byte)'A';
		byte ch2 = (byte)'B';
		if (flagit == 0)
		{
			ch1 = (byte)'B';
			ch2 = (byte)'A';
		}
		if (a >= 13 && a < 25)
		{
			a -= 12;
			state1 = 1;
		}
		else if (a < 13 && a >= 1)
		{
			a = 12 - a;
			state1 = 2;
		}
		else if (a == 25)
		{
			state1 = 0;
		}
		else
		{
			state1 = 3;
		}
		if (b >= 13 && b < 25)
		{
			b -= 12;
			state2 = 1;
		}
		else if (b < 13 && b >= 1)
		{
			b = 12 - b;
			state2 = 2;
		}
		else if (b == 25)
		{
			state2 = 0;
		}
		else
		{
			state2 = 3;
		}
		if (c >= 13 && c < 25)
		{
			c -= 12;
			state3 = 1;
		}
		else if (c < 13 && c >= 1)
		{
			c = 12 - c;
			state3 = 2;
		}
		else if (c == 25)
		{
			state3 = 0;
		}
		else
		{
			state3 = 3;
		}
		if (d >= 13 && d < 25)
		{
			d -= 12;
			state4 = 1;
		}
		else if (d < 13 && d >= 1)
		{
			d = 12 - c;
			state4 = 2;
		}
		else if (d == 25)
		{
			state4 = 0;
		}
		else
		{
			state4 = 3;
		}

		if (state1 == 1)
		{
			System.out.printf("%c%d ",ch1,a);
		}
		else if (state1 == 2)
		{
			System.out.printf("%c%d ",ch2,a);
		}
		else if (state1 == 0)
		{
			System.out.print("Z ");
		}
		else
		{
			System.out.print("pass\n");
		}

		if (state2 == 1)
		{
			System.out.printf("%c%d\n",ch1,b);
		}
		else if (state2 == 2)
		{
			System.out.printf("%c%d\n",ch2,b);
		}
		else if (state1 != 3)
		{
			System.out.print("pass\n");
		}

		if (state3 == 1)
		{
			System.out.printf("%c%d ",ch1,c);
		}
		else if (state3 == 2)
		{
			System.out.printf("%c%d ",ch2,c);
		}
		else if (state3 == 0)
		{
			System.out.print("Z ");
		}
		else
		{
			System.out.print("pass\n");
		}

		if (state4 == 1)
		{
			System.out.printf("%c%d\n",ch1,d);
		}
		else if (state4 == 2)
		{
			System.out.printf("%c%d\n",ch2,d);
		}
		else if (state3 != 3)
		{
			System.out.print("pass\n");
		}
	}
	public static void printit1(int a,int b, int flagit)
	{
		int state1;
		int state2;
		int state3;
		int state4;
		byte ch1 = (byte)'A';
		byte ch2 = (byte)'B';
		if (flagit == 0)
		{
			ch1 = (byte)'B';
			ch2 = (byte)'A';
		}
		if (a >= 13 && a < 25)
		{
			a -= 12;
			state1 = 1;
		}
		else if (a < 13 && a >= 1)
		{
			a = 12 - a;
			state1 = 2;
		}
		else if (a == 25)
		{
			state1 = 0;
		}
		else
		{
			state1 = 3;
		}
		if (b >= 13 && b < 25)
		{
			b -= 12;
			state2 = 1;
		}
		else if (b < 13 && b >= 1)
		{
			b = 12 - b;
			state2 = 2;
		}
		else if (b == 25)
		{
			state2 = 0;
		}
		else
		{
			state2 = 3;
		}
		if (state1 == 1)
		{
			System.out.printf("%c%d ",ch1,a);
		}
		else if (state1 == 2)
		{
			System.out.printf("%c%d ",ch2,a);
		}
		else if (state1 == 0)
		{
			System.out.print("Z ");
		}
		else
		{
			System.out.print("pass\n");
		}

		if (state2 == 1)
		{
			System.out.printf("%c%d\n",ch1,b);
		}
		else if (state2 == 2)
		{
			System.out.printf("%c%d\n",ch2,b);
		}
		else if (state1 != 3)
		{
			System.out.print("pass\n");
		}
	}
	public static int[] t1 = new int[300];
	public static int[] t2 = new int[300];
	public static int[] t3 = new int[300];
	public static int[] t4 = new int[300];
	public static int Main()
	{
		int flagit4 = 1;
		int flagit1;
		int counter = 0;
		int lengthit;
		int temp;
		int j;
		int i;
		int n = 12;
		int calc;
		int cnt = 2;
		int x;
		int ans = 0;
		int pointit = 1;
		int flag;
		int d1;
		int d2;
		int d;
		int val;
		int da;
		int dp;
		int max;
		int pos;
		int lenit = 0;
		int flagit = 1;
		int flagit3 = 1;
		byte ch;
		max = -1000000000;
		pos = -1;
		for (i = 1;i <= 24;i++)
		{
			String tempVar = ConsoleInput.scanfRead();
			if (tempVar != null)
			{
				array1[i] = Integer.parseInt(tempVar);
			}
		}
		ch = System.in.read();
		ch = System.in.read();
		array1[26] = 0;
		array1[0] = 0;
		while (ch != '\n' && ch != ' ')
		{
			if (ch == 'a')
			{
				array1[0]++;
			}
			if (ch == 'b')
			{
				array1[26]++;
			}
			ch = System.in.read();
		}
		String tempVar2 = ConsoleInput.scanfRead();
		if (tempVar2 != null)
		{
			d1 = Integer.parseInt(tempVar2);
		}
		String tempVar3 = ConsoleInput.scanfRead(" ");
		if (tempVar3 != null)
		{
			d2 = Integer.parseInt(tempVar3);
		}
		if (array1[0] > 1)
		{
			if (array1[d1] >= -1 && array1[d2] >= -1)
			{
				copyit(array2, array1);
				if (array1[d1] == -1)
				{
					array1[0]--;
					array1[d1] = 1;
					array1[26]++;
				}
				else
				{
					array1[0]--;
					array1[d1]++;
				}
				if (array1[d2] == -1)
				{
					array1[0]--;a
					array1[d2] = 1;
					array1[26]++;
				}
				else
				{
					array1[0]--;
					array1[d2]++;
				}
				t1[lenit] = 0;
				t2[lenit] = d1;
				t3[lenit] = 0;
				t4[lenit] = d2;
				lenit++;
				val = level2(array1);
				//val=evalfunc(array1);
				if (val > max)
				{
					max = val;
					pos = lenit - 1;
				}
				copyit(array1, array2);
				copyit(array2, array1);
				if (array1[d1 + d2] >= -1)
				{
					if (array1[d1 + d2] == -1)
					{
						array1[0]--;
						array1[d1 + d2] = 1;
						array1[26]++;
					}
					else
					{
						array1[0]--;
						array1[d1 + d2]++;
					}
					t1[lenit] = 0;
					t2[lenit] = d1;
					t3[lenit] = d1;
					t4[lenit] = d2;
					lenit++;
					val = level2(array1);
					if (val > max)
					{
						max = val;
						pos = lenit - 1;
					}
				}
				copyit(array1, array2);
				System.out.printf("%d %d\n%d %d\n",t1[pos],t2[pos],t3[pos],t4[pos]);
				return 0;
			}
			else if (array1[d1] >= -1 || array1[d2] >= -1)
			{
				if (array1[d1 + d2] >= -1)
				{
					if (array1[d1 + d2] == -1)
					{
						array1[0]--;
						array1[d1 + d2] = 1;
						array1[26]++;
					}
					else
					{
						array1[0]--;
						array1[d1 + d2]++;
					}
					t1[lenit] = 0;
					t2[lenit] = d2;
					t3[lenit] = d2;
					t4[lenit] = d1 + d2;
					if (array1[d1] >= -1)
					{
						t1[lenit] = 0;
						t2[lenit] = d1;
						t3[lenit] = d1;
						t4[lenit] = d1 + d2;
					}
					System.out.printf("%d %d\n%d %d\n",t1[lenit],t2[lenit],t3[lenit],t4[lenit]);
					return 0;
				}
				if (array1[d1] >= -1)
				{
					t1[lenit] = 0;
					t2[lenit] = d1;
					if (array1[d1] == -1)
					{
						array1[0]--;
						array1[d1] = 1;
						array1[26]++;
					}
					else
					{
						array1[0]--;
						array1[d1]++;
					}
					System.out.printf("%d %d\npass\n",t1[lenit],t2[lenit]);
					return 0;
				}
				else if (array1[d2] >= -1)
				{
					t1[lenit] = 0;
					t2[lenit] = d2;
					if (array1[d2] == -1)
					{
						array1[0]--;
						array1[d2] = 1;
						array1[26]++;
					}
					else
					{
						array1[0]--;
						array1[d2]++;
					}
					System.out.printf("%d %d\npass\n",t1[lenit],t2[lenit]);
				}
				return 0;
			}
			else if (array1[d1] < -1 && array1[d2] < -1)
			{
				System.out.print("pass\npass\n");
				return 0;
			}
		}
		else if (array1[0] == 1)
		{
			if (array1[d1] < -1 && array1[d2] < -1)
			{
				System.out.print("pass\npass\n");
				return 0;
			}
			cnt = 2;
			while (cnt-- != 0)
			{
				copyit(array2, array1);
				da = d1;
				dp = d2;
				if (cnt == 0)
				{
					da = d2;
					dp = d1;
				}
				if (array1[da] >= -1)
				{
					flagit1 = 1;
					if (array1[da] == -1)
					{
						array1[da] = 1;
						array1[26]++;
						array1[0]--;
					}
					else
					{
						array1[da]++;
						array1[0]--;
					}
					for (j = 1;j <= 24;j++)
					{
						copyit(array3, array1);
						if (array1[j] <= 0)
						{
							continue;
						}
						if (array1[j + dp] >= -1 && j + dp <= 24)
						{
							flagit1 = 0;
							if (array1[j + dp] == -1)
							{
								array1[j + dp] = 1;
								array1[j]--;
								array1[26]++;
							}
							else
							{
								array1[j + dp]++;
								array1[j]--;
							}
							t1[lenit] = 0;
							t2[lenit] = da;
							t3[lenit] = j;
							t4[lenit] = j + dp;
							val = level2(array1);
							if (val > max)
							{
								max = val;
								pos = lenit;
							}
							lenit++;
						}
						copyit(array1, array3);
					}
					if (flagit1 != 0)
					{
						t1[lenit] = 0;
						t2[lenit] = da;
						t3[lenit] = -1;
						t4[lenit] = -1;
						array1[25] = 1;
						val = level2(array1);
						if (val > max)
						{
							max = val;
							pos = lenit;
						}
					}
				}
				copyit(array1, array2);
			}
			if (pos == -1)
			{
				System.out.print("pass\npass\n");
				return 0;
			}
			if (t3[pos] == -1)
			{
				System.out.printf("%d %d\npass\n",t1[pos],t2[pos]);
				return 0;
			}
			System.out.printf("%d %d\n%d %d\n",t1[pos],t2[pos],t3[pos],t4[pos]);
			return 0;
		}
		while (pointit <= 24)
		{
			if (array1[pointit] <= 0)
			{
				pointit++;
				continue;
			}
			cnt = 2;
			if (d1 == d2)
			{
				cnt = 1;
			}
			x = pointit;
			while (cnt-- != 0)
			{
				da = d1;
				dp = d2;
				if (cnt == 0)
				{
					da = d2;
					dp = d1;
				}
				copyit(array2, array1);
				flagit1 = 1;
				if ((array1[pointit + da] >= -1 && pointit + da <= 24) || (behaviorcheck(array1) != 0 && pointit + da >= 25 && flagit3 == 1))
				{
					if (behaviorcheck(array1) != 0 && pointit + da >= 25 && flagit3 == 1)
					{
						flagit3 = 0;
					}
					if (array1[pointit + da] == -1)
					{
						array1[pointit]--;
						if (pointit + da <= 24)
						{
							array1[pointit + da] = 1;
						}
						array1[26] += 1;
					}
					else
					{
						array1[pointit]--;
						if (pointit + da <= 24)
						{
							array1[pointit + da]++;
						}
					}
					x = pointit;
					while (x <= 24)
					{
						copyit(array3, array1);
						if (array1[x] > 0)
						{
							if ((array1[x + dp] >= -1 && x + dp <= 24) || (behaviorcheck(array1) != 0 && x + dp >= 25 && flagit4 == 1))
							{
								if (behaviorcheck(array1) != 0 && x + dp >= 25 && flagit4 == 1)
								{
									flagit4 = 0;
								}
								flagit1 = 0;
								if (array1[x + dp] == -1)
								{
									array1[x]--;
									if (x + dp <= 24)
									{
										array1[x + dp] = 1;
									}
									array1[26] += 1;
								}
								else
								{
									array1[x]--;
									if (x + dp <= 24)
									{
										array1[x + dp]++;
									}
								}
								t1[lenit] = pointit;
								t2[lenit] = pointit + da;
								t3[lenit] = x;
								t4[lenit] = x + dp;
								if (t2[lenit] > 24)
								{
									t2[lenit] = 0;
								}
								if (t4[lenit] > 24)
								{
									t4[lenit] = 0;
								}
								val = level2(array1);
								lenit++;
								if (val > max)
								{
									max = val;
									pos = lenit - 1;
								}
								ans++;
							}
						}
						x++;
						copyit(array1, array3);
					}
					if (flagit1 == 1)
					{
						t1[lenit] = pointit;
						t2[lenit] = pointit + da;
						t3[lenit] = -1;
						t4[lenit] = -1;
						array1[25] = 1;
						val = level2(array1);
						if (val > max)
						{
							max = val;
							pos = lenit;
						}
						lenit++;
					}
					copyit(array1, array2);
				}
				else
				{
					copyit(array1, array2);
					continue;
				}
			}
			pointit++;
		}
		if (pos == -1)
		{
			System.out.print("pass\npass\n");
			return 0;
		}
		if (t3[pos] == -1)
		{
			if (t2[pos] == 0)
			{
			System.out.printf("%d O\npass\n",t1[pos]);
			}
			return 0;
		}
		if (t2[pos] == 0 && t4[pos] == 0)
		{
			System.out.printf("%d O\n%d O\n",t1[pos],t3[pos]);
		}
		else if (t2[pos] == 0)
		{
			System.out.printf("%d O\n%d %d\n",t1[pos],t3[pos],t4[pos]);
		}
		else if (t4[pos] == 0)
		{
			System.out.printf("%d %d\n%d O\n",t1[pos],t2[pos],t3[pos]);
		}
		else
		{
			System.out.printf("%d %d\n%d %d\n",t1[pos],t2[pos],t3[pos],t4[pos]);
		}
		return 0;
	}
}
