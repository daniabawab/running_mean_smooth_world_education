rlsani = function(x,y,h,i){
# Running line smooth function used for animation
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
# sequence of x values over which to compute running line
xs = seq(min(x), max(x), length=50)
interval = ani.options("interval") # the time interval for the animation (unit is seconds)
while (i <= ani.options("nmax")) { # step through the image frames
	# identify y and x values in neighborhood
	ynew = y[(x>xs[i]-h)&(x<xs[i]+h)]
	xnew = x[(x>xs[i]-h)&(x<xs[i]+h)]
	# value at which to make prediction in neighborhood
	xpred = data.frame(xnew = xs[i])
	# line prediction at xs[i]
	ys[i] = predict(lm(ynew~xnew), newdata = xpred)
      plot(x, y, xlab="Math Proficiency", ylab="Birth Rate")
	# plot regression line over whole range of x
	#abline(lm(ynew~xnew), col="blue")
	# plot regression line only in neighborhood
	x1 = c(xs[i]-h,xs[i]+h)
	xpred=data.frame(xnew=x1)
	predict(lm(ynew~xnew), newdata = xpred)
	y1 =predict(lm(ynew~xnew), newdata = xpred)
	lines(x1,y1,col="blue")
	# plot smooth predicted values, as points "X", up to current xs
      ##text(xs[1:i], ys[1:i], "X")
	# plot smooth, as a line, up to current xs 
	lines(xs[1:i],ys[1:i])
	##text(x[(x>xs[i]-h)&(x<xs[i]+h)],y[(x>xs[i]-h)&(x<xs[i]+h)],"X",col="blue")
	lines(x[(x>xs[i]-h)&(x<xs[i]+h)], y[(x>xs[i]-h)&(x<xs[i]+h)], 
		type="p", pch=19, col="red")
	# draw vertical lines around neighborhood
	#abline(v=xs[i]-h); abline(v=xs[i]+h)
	# draw grey box around neighborhood
	lines(x=c(xs[i]-h-2,xs[i]-h-2,xs[i]+h+2,xs[i]+h+2), 
		y=c(min(y)-10,max(y)+10,max(y)+10,min(y)-10),
		lwd=3,col="grey")
	lines(x=c(xs[i]-h-2,xs[i]-h-2,xs[i]+h+2,xs[i]+h+2), 
		y=c(max(y)+10,min(y)-10,min(y)-10,max(y)+10),
		lwd=3,col="grey")
	text(xs[i],ys[i],"X")
	i=i+1 # step forward to next grid point (frame)
	Sys.sleep(interval)
    }
    invisible(NULL)
    data.frame(xs,ys)
}
