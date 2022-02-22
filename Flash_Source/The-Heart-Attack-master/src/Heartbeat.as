//DONE
package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.ColorTween;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Heartbeat extends Entity
	{
		//DONE
		public var heartController:HeartController;
		public var direction:Boolean;
		public var image:Image;
		public var hit:Boolean = false;
		public var missed:Boolean = false;
		
		public var fading:Boolean = false;
		public var fadeTween:ColorTween;
		
		public var paused:Boolean = false;
		
		//DONE
		public function Heartbeat(x:Number = 0, y:Number = 0, image:Image = null, direction:Boolean = true) 
		{
			super(x, y, image);
			this.direction = direction;
			this.image = image;			
			image.scaleX = 2;
			image.scaleY = 2;
			image.originX = 0;
			image.originY = image.height / 2;
			image.x = 0;
			image.y = 0;	
			setHitbox(image.scaledWidth, image.scaledHeight, image.originX, image.originY);				
		}
		
		//DONE
		override public function added():void
		{
			reset();
		}
		
		//DONE
		public function reset():void
		{
			direction = heartController.direction;
			hit = false;
			missed = false;
			image.color = Global.PULSE_COLOR_DEFAULT;
			image.alpha = 1;
			fading = false;
			paused = false;
			
			// Adjust scale based on health
			shrink();
			
			y = heartController.y + FP.halfHeight / 2
		}
		
		//DONE
		override public function update():void
		{
			//trace('heartbeat update');
			if (!paused)
			{
				if (direction)
					x -= heartController.pulseSpeed;
				else
					x += heartController.pulseSpeed;
			}	
			
			// Off screen
			if (x < (0 - image.scaledWidth * 4) || x > (FP.width + image.scaledWidth * 4))
			{
				offscreenAction();
			}
			
			// Fade out?
			if (fading)
				image.alpha = fadeTween.alpha;
			
			super.update();
		}
		
		//DONE
		public function checkMissed():Boolean
		{
			if (hit || missed)
				return false;
			else if (direction && (x + width < heartController.hotZone.x))
				return true;
			else if (!direction && (x > heartController.hotZone.x + Global.HOT_ZONE_WIDTH))
				return true;
			else
				return false;
		}
		
		//DONE
		public function hitAction():void
		{
			
		}
		
		//DONE
		public function missedAction():void
		{
			
		}
		
		//DONE
		public function pause():void
		{
			this.paused = true;
		}
		
		//DONE
		public function unpause():void
		{
			this.paused = false;
		}
		
		//DONE
		public function fadeOut(duration:Number):void
		{
			//trace('heartbeat fade out');
			fading = true;
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween, true);
			fadeTween.tween(duration, Colors.WHITE, Colors.WHITE, 1, 0);
		}
		
		//DONE
		public function shrink():void
		{
			image.scaleX = 2;
			image.scaleY = 2 * heartController.health;
			image.originX = 0;
			image.originY = image.height / 2;
			image.x = 0;
			image.y = 0;	
			setHitbox(image.scaledWidth, image.scaledHeight, image.originX, image.originY);		
		}
		
		//DONE
		public function checkOverlapHotZone():Boolean
		{
			if (x > heartController.hotZone.x + Global.HOT_ZONE_WIDTH)
				return false;
			else if (x + width < heartController.hotZone.x)
				return false;
			else
				return true;
		}
		
		//DONE
		public function checkOverlapForgivingHotZone():Boolean
		{
			if (x > heartController.hotZone.x + Global.HOT_ZONE_WIDTH + Global.HOT_ZONE_WIDTH * 0.4)
				return false;
			else if (x + width < heartController.hotZone.x - Global.HOT_ZONE_WIDTH * 0.4)
				return false;
			else
				return true;
		}		
		
		//DONE
		public function offscreenAction():void
		{
			//trace('heart beat offscreen action');
			FP.world.recycle(this);
		}
		
		public function destroy():void
		{
			FP.world.recycle(this);
		}
	}

}