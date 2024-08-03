rmsani = function(x,y,h,i){
# Running mean smooth function used for animation.
# Input
#   x, y: data (input, output)
#   h: bandwidth
#   i: grid index for animation
# Output: images for each frame of the animation
#
# Grid of x-values determined ahead of time.  Could give user that option.
# RL; 7/14/23

n = length(y) # sample size
ys = 0 # smooth storage
# sequence of x values over which to compute running mean
xs = seq(min(x), max(x), length=50)
interval = ani.options("interval") # the time interval for the animation (unit is seconds)
while (i <= ani.options("nmax")) { # step through the image frames
	# mean y in neighborhood
	ys[i] = mean(y[(x>xs[i]-h)&(x<xs[i]+h)])
	# scatterplot
  plot(x, y, xlab="Math Proficiency", ylab="Birth Rate")
	lines(xs[1:i],ys[1:i])
	lines(x[(x>xs[i]-h)&(x<xs[i]+h)], y[(x>xs[i]-h)&(x<xs[i]+h)], 
		type="p", pch=19, col="red")
	# draw grey box around neighborhood
	lines(x=c(xs[i]-h-2,xs[i]-h-2,xs[i]+h+2,xs[i]+h+2), 
		y=c(min(y)-10,max(y)+10,max(y)+10,min(y)-10),
		lwd=3,col="grey")
	lines(x=c(xs[i]-h-2,xs[i]-h-2,xs[i]+h+2,xs[i]+h+2), 
		y=c(max(y)+10,min(y)-10,min(y)-10,max(y)+10),
		lwd=3,col="grey")
	text(xs[i],ys[i],"X") # label smooth at ith x-value
	i=i+1 # step forward to next grid point (frame)
	Sys.sleep(interval)
    }
    invisible(NULL)
    data.frame(xs,ys)
}
