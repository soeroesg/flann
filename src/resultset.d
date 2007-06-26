/*
Project: aggnn
*/


import heap;
import util;


struct Point {

	static Point opCall(float[] point, int index) 
	{
		Point p;
		p.point = point;
		p.index = index;
		
		return p;
	}

	float[] point;
	int index;
	float dist;
}

class ResultSet 
{
	Point[] points;
	float[] target;
	
	int count;
	
	float worst_dist;
	
	public this(int capacity) 
	{
		points = new Point[capacity];
	}
	
	public this(float[] target, int capacity)
	{
		this(capacity);
		init(target);
	}
	
	public void init(float[] target) 
	{
		this.target = target;
		count = 0;
	}
	
	
	public int getPointIndex(int num) 
	{	
		if (num<count) {
			return points[num].index;
		}
		else {
			return -1;
		}
	}
	
	public bool full() 
	{
		return count == points.length;
	}
	
	public bool addPoint(Point p) 
	{
		p.dist = target.squaredDist(p.point);
		
		if (count<points.length) {
			points[count++] = p;	
		} 
		else if (p.dist < points[count-1].dist) {
			points[count-1] = p;
		} 
		else { 
			return false;
		}
		
		int i = count-1;
		// bubble up
		while (i>=1 && points[i].dist<points[i-1].dist) {
			swap(points[i],points[i-1]);
			i--;
		}
		
		return true;
	}
	
	

}