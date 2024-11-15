import boto3
import sys
from botocore.exceptions import ClientError

def delete_bucket_contents(s3_client, bucket_name):
    """Delete all objects and object versions in the bucket"""
    try:
        bucket = boto3.resource('s3').Bucket(bucket_name)
        
        # Delete all objects and their versions
        bucket.object_versions.delete()
        print(f"All objects in bucket '{bucket_name}' have been deleted")
        
    except ClientError as e:
        print(f"Error clearing bucket contents: {e}")
        return False
    return True

def delete_lebron_bucket():
    """Main function to delete the lebron bucket"""
    bucket_name = 'lebron'
    
    # Create S3 client with east region since the bucket is in us-east-1
    s3_client = boto3.client('s3', region_name='us-east-1')
    
    try:
        # Check if bucket exists
        s3_client.head_bucket(Bucket=bucket_name)
    except ClientError as e:
        error_code = e.response['Error']['Code']
        if error_code == '404':
            print(f"Bucket '{bucket_name}' does not exist")
            return
        else:
            print(f"Error accessing bucket: {e}")
            return

    # Delete all objects in the bucket first
    if not delete_bucket_contents(s3_client, bucket_name):
        return

    # Delete the empty bucket
    try:
        s3_client.delete_bucket(Bucket=bucket_name)
        print(f"Bucket '{bucket_name}' has been successfully deleted")
    except ClientError as e:
        print(f"Error deleting bucket: {e}")
        return

if __name__ == "__main__":
    delete_lebron_bucket()
