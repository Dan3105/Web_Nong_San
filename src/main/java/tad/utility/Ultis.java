package tad.utility;

import tad.entity.Feedback;
import tad.entity.Product;

public class Ultis {
	public static double getAvgStar(Product product) {
		double avgStar = 0;
		for (Feedback f : product.getFeedbacks()) {
			avgStar += f.getRatingStar();
		}
		if (product.getFeedbacks().size() > 0)
			avgStar /= product.getFeedbacks().size();
		return avgStar;
	}

}
