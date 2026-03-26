resource "aws_cloudfront_distribution" "this" {
  provider = aws.use1

  origin {
    domain_name = aws_lb.this.dns_name
    origin_id   = "alb-origin"
  }

  enabled = true

  default_cache_behavior {
    target_origin_id       = "alb-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
  }

  depends_on = [aws_lb.this]
}