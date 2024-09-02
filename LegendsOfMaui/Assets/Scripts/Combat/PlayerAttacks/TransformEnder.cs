using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class TransformEnder : MonoBehaviour
    {
        public void EndTransform()
        {
            TransformAttackCaller attackCaller = GetComponentInParent<TransformAttackCaller>();
            attackCaller.UndoTransform(gameObject);
        }
    }
}