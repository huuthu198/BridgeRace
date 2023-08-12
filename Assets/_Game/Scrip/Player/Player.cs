
using UnityEngine;
using UnityEngine.AI;

public class Player : MonoBehaviour
{
    public NavMeshAgent agent;
    [SerializeField] private float speed = 60f;
  
    private float horizontal;
    private float vertical;
    private void FixedUpdate()
    {
        horizontal = UltimateJoystick.GetHorizontalAxis("PlayerJoystick");
        vertical = UltimateJoystick.GetVerticalAxis("PlayerJoystick");
        JoystickMovement();
        Rotate();
       
    }

    protected virtual void JoystickMovement()
    {
        //rb.velocity = new Vector3(horizontal * speed, rb.velocity.y, vertical * speed);
        Vector3 movement = new Vector3(horizontal, 0f, vertical).normalized;
        Vector3 moveDestination = transform.position + movement * speed * Time.deltaTime;
        agent.SetDestination(moveDestination);
        
    }

    protected virtual void Rotate()
    {
        if (horizontal != 0 || vertical != 0)
        {
            float targetAngle = Mathf.Atan2(horizontal, vertical) * Mathf.Rad2Deg;
            Quaternion targetRotation = Quaternion.Euler(0f, targetAngle, 0f);
            transform.rotation = Quaternion.Lerp(transform.rotation, targetRotation, Time.deltaTime * 10);
        }
    }
   
  
}